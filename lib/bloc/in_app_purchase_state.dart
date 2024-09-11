part of 'in_app_purchase_bloc.dart';

enum InAppPurchaseStatus {
  initial,
  loading,
  ready,
  restored,
  purchaseComplete,
  cancelled,
  error,
}

const Set<String> productIds = {
  'com.rapidops.vetcomm.monthly',
  'com.rapidops.vetcomm.weekly',
  'com.rapidops.vetcomm.yearly'
};

@freezed
class InAppPurchaseState with _$InAppPurchaseState {
  const factory InAppPurchaseState({
    @Default(InAppPurchaseStatus.initial) InAppPurchaseStatus status,
    String? error,
    @Default([]) List<ProductDetails> products,
    PurchaseDetails? activeSubscription,
  }) = _InAppPurchaseState;
}