part of 'stripe_payment_bloc.dart';

@freezed
class StripePaymentState with _$StripePaymentState {
  const factory StripePaymentState.initial() = _Initial;
  const factory StripePaymentState.loading() = StripePaymentLoadingState;
  const factory StripePaymentState.error({@Default("") String errorMessage }) =StripePaymentErrorState;
  const factory StripePaymentState.success() = StripePaymentSuccessState;
}
