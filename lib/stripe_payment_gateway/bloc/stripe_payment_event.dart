part of 'stripe_payment_bloc.dart';

@freezed
class StripePaymentEvent with _$StripePaymentEvent {
  const factory StripePaymentEvent.started() = _Started;
  const factory StripePaymentEvent.initializePayment({required double amount, @Default('usd') String currency, }) = _StripePaymentInitializePayment;
}
