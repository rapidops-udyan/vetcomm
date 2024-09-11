part of 'in_app_purchase_bloc.dart';

@freezed
class InAppPurchaseEvent with _$InAppPurchaseEvent {
  const factory InAppPurchaseEvent.initialize() = _InAppPurchaseInitializeEvent;
  const factory InAppPurchaseEvent.fetchProducts() = _InAppPurchaseFetchProductsEvent;
  const factory InAppPurchaseEvent.restorePurchases() = _InAppPurchaseRestorePurchasesEvent;
  const factory InAppPurchaseEvent.buyProduct(ProductDetails product, [PurchaseDetails? oldPurchaseDetails]) = _InAppPurchaseBuyProductEvent;
  const factory InAppPurchaseEvent.updatePurchases(List<PurchaseDetails> purchaseDetailsList) = _InAppPurchaseUpdatePurchasesEvent;
}