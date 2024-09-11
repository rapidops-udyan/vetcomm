import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

part 'in_app_purchase_bloc.freezed.dart';
part 'in_app_purchase_event.dart';
part 'in_app_purchase_state.dart';

class InAppPurchaseBloc extends Bloc<InAppPurchaseEvent, InAppPurchaseState> {
  final InAppPurchase _iap = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  InAppPurchaseBloc() : super(const InAppPurchaseState()) {
    on<_InAppPurchaseInitializeEvent>(_onInitialize);
    on<_InAppPurchaseFetchProductsEvent>(_onFetchProducts);
    on<_InAppPurchaseRestorePurchasesEvent>(_onRestorePurchases);
    on<_InAppPurchaseBuyProductEvent>(_onBuyProduct);
    on<_InAppPurchaseUpdatePurchasesEvent>(_onUpdatePurchases);
  }

  Future<void> _onInitialize(_InAppPurchaseInitializeEvent event,
      Emitter<InAppPurchaseState> emit) async {
    emit(state.copyWith(status: InAppPurchaseStatus.loading));

    final isAvailable = await _iap.isAvailable();
    if (Platform.isIOS) {
      final iosPlatformAddition =
      _iap.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(PaymentQueueDelegate());
    }
    if (!isAvailable) {
      emit(state.copyWith(
          status: InAppPurchaseStatus.error,
          error: 'In-App Purchase not available'));
      return;
    }

    _subscription = _iap.purchaseStream.listen(
          (purchases) => add(InAppPurchaseEvent.updatePurchases(purchases)),
      onDone: () => _subscription.cancel(),
      onError: (error) => emit(state.copyWith(
          status: InAppPurchaseStatus.error, error: error.toString())),
    );

    add(const InAppPurchaseEvent.fetchProducts());
    add(const InAppPurchaseEvent.restorePurchases());
  }

  Future<void> _onFetchProducts(_InAppPurchaseFetchProductsEvent event,
      Emitter<InAppPurchaseState> emit) async {
    final ProductDetailsResponse response =
    await _iap.queryProductDetails(productIds);

    if (response.error != null) {
      emit(state.copyWith(
          status: InAppPurchaseStatus.error, error: response.error!.message));
    } else {
      emit(state.copyWith(
          products: response.productDetails,
          status: InAppPurchaseStatus.ready));
    }
  }

  Future<void> _onRestorePurchases(_InAppPurchaseRestorePurchasesEvent event,
      Emitter<InAppPurchaseState> emit) async {
    await _iap.restorePurchases();
  }

  Future<void> _onBuyProduct(_InAppPurchaseBuyProductEvent event,
      Emitter<InAppPurchaseState> emit) async {
    final PurchaseParam purchaseParam =
    _buildPurchaseParam(event.product, event.oldPurchaseDetails);

    try {
      final bool success =
      await _iap.buyNonConsumable(purchaseParam: purchaseParam);
      if (!success) {
        emit(state.copyWith(
            status: InAppPurchaseStatus.error, error: 'Purchase failed'));
      }
    } catch (e) {
      emit(state.copyWith(
          status: InAppPurchaseStatus.error,
          error: 'Failed to make purchase: ${e.toString()}'));
    }
  }

  PurchaseParam _buildPurchaseParam(
      ProductDetails product, PurchaseDetails? oldPurchaseDetails) {
    if (Platform.isAndroid) {
      if (oldPurchaseDetails != null) {
        final oldPurchase = oldPurchaseDetails as GooglePlayPurchaseDetails;
        return GooglePlayPurchaseParam(
          productDetails: product,
          changeSubscriptionParam: ChangeSubscriptionParam(
            oldPurchaseDetails: oldPurchase,
            replacementMode: ReplacementMode.withTimeProration,
          ),
        );
      } else {
        return GooglePlayPurchaseParam(productDetails: product);
      }
    } else if (Platform.isIOS) {
      return PurchaseParam(
        productDetails: product,
        applicationUserName: null,
      );
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  Future<void> _onUpdatePurchases(_InAppPurchaseUpdatePurchasesEvent event,
      Emitter<InAppPurchaseState> emit) async {
    for (var purchaseDetails in event.purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        emit(state.copyWith(status: InAppPurchaseStatus.loading));
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        emit(state.copyWith(
            status: InAppPurchaseStatus.error,
            error: purchaseDetails.error!.message));
      } else if (purchaseDetails.status == PurchaseStatus.purchased ||
          purchaseDetails.status == PurchaseStatus.restored) {
        final bool valid = await _verifyPurchase(purchaseDetails);
        if (valid) {
          await _iap.completePurchase(purchaseDetails);
          emit(state.copyWith(
            status: purchaseDetails.status == PurchaseStatus.restored
                ? InAppPurchaseStatus.restored
                : InAppPurchaseStatus.purchaseComplete,
            activeSubscription: purchaseDetails,
          ));
        } else {
          emit(state.copyWith(
              status: InAppPurchaseStatus.error, error: 'Invalid purchase'));
        }
      } else if (purchaseDetails.status == PurchaseStatus.canceled) {
        emit(state.copyWith(
            status: InAppPurchaseStatus.cancelled, error: 'Purchase Cancelled'));
      }
    }
    emit(state.copyWith(status: InAppPurchaseStatus.ready));
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    return true;
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

class PaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return true;
  }
}