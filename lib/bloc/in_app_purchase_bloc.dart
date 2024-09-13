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
    if (!isAvailable) {
      emit(state.copyWith(
          status: InAppPurchaseStatus.error,
          error: 'In-App Purchase not available'));
      return;
    }

    if (Platform.isIOS) {
      final iosPlatformAddition =
          _iap.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    _subscription = _iap.purchaseStream.listen(
      (purchases) => add(InAppPurchaseEvent.updatePurchases(purchases)),
      onDone: () => _subscription.cancel(),
      onError: (error) => add(const InAppPurchaseEvent.updatePurchases([])),
    );

    add(const InAppPurchaseEvent.fetchProducts());
  }

  Future<void> _onFetchProducts(_InAppPurchaseFetchProductsEvent event,
      Emitter<InAppPurchaseState> emit) async {
    emit(state.copyWith(status: InAppPurchaseStatus.loading));

    final ProductDetailsResponse response =
        await _iap.queryProductDetails(productIds);

    if (response.error != null) {
      emit(state.copyWith(
          status: InAppPurchaseStatus.error, error: response.error!.message));
    } else {
      emit(state.copyWith(
          products: response.productDetails,
          status: InAppPurchaseStatus.ready));
      add(const InAppPurchaseEvent.restorePurchases());
    }
  }

  Future<void> _onRestorePurchases(_InAppPurchaseRestorePurchasesEvent event,
      Emitter<InAppPurchaseState> emit) async {
    try {
      await _iap.restorePurchases();
    } catch (e) {
      emit(state.copyWith(
          status: InAppPurchaseStatus.error,
          error: 'Failed to restore purchases: ${e.toString()}'));
    }
  }

  Future<void> _onBuyProduct(_InAppPurchaseBuyProductEvent event,
      Emitter<InAppPurchaseState> emit) async {
    emit(state.copyWith(status: InAppPurchaseStatus.loading));

    try {
      final success =
          await _buyProduct(event.product, event.oldPurchaseDetails);
      if (!success) {
        emit(state.copyWith(
            status: InAppPurchaseStatus.error, error: 'Purchase failed'));
      }
    } catch (e) {
      emit(state.copyWith(
          status: InAppPurchaseStatus.error,
          error: 'Failed to make purchase: ${(e as SKError).code}${(e as SKError).userInfo}${(e as SKError).domain}'));
    }
  }

  Future<bool> _buyProduct(
      ProductDetails product, PurchaseDetails? oldPurchase) async {
    PurchaseParam? purchaseParam;

    if (Platform.isAndroid) {
      if (oldPurchase != null) {
        purchaseParam = GooglePlayPurchaseParam(
          productDetails: product,
          changeSubscriptionParam: ChangeSubscriptionParam(
            oldPurchaseDetails: oldPurchase as GooglePlayPurchaseDetails,
            replacementMode: ReplacementMode.withTimeProration,
          ),
        );
      } else {
        purchaseParam = GooglePlayPurchaseParam(productDetails: product);
      }
    } else if (Platform.isIOS) {
      purchaseParam = PurchaseParam(
        productDetails: product,
        applicationUserName: null,
      );
    } else {
      throw UnsupportedError('Unsupported platform');
    }
    return await _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }

  Future<void> _onUpdatePurchases(_InAppPurchaseUpdatePurchasesEvent event,
      Emitter<InAppPurchaseState> emit) async {
    for (var purchaseDetails in event.purchaseDetailsList) {
      print(purchaseDetails.status);
      print(purchaseDetails.productID);
      print(purchaseDetails.purchaseID);
      print(purchaseDetails.pendingCompletePurchase);
      print(purchaseDetails.error);
      if (purchaseDetails.status == PurchaseStatus.pending) {
        emit(state.copyWith(status: InAppPurchaseStatus.loading));
      } else {
        if (purchaseDetails.pendingCompletePurchase) {
          await InAppPurchase.instance.completePurchase(purchaseDetails);
        }
        if (purchaseDetails.status == PurchaseStatus.error) {
          emit(state.copyWith(
              status: InAppPurchaseStatus.error,
              error: purchaseDetails.error!.message));
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          final bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
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
          emit(state.copyWith(status: InAppPurchaseStatus.cancelled));
        }
      }
    }
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) async {
    // Here you should implement your own purchase verification logic
    // This could involve verifying the purchase with your server
    return true;
  }

  @override
  Future<void> close() async {
    if (Platform.isIOS) {
      final iosPlatformAddition =
          _iap.getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(null);
    }
    await _subscription.cancel();
    return super.close();
  }
}

class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(SKPaymentTransactionWrapper transaction,
          SKStorefrontWrapper storefront) =>
      true;

  @override
  bool shouldShowPriceConsent() => false;
}
