import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../stripe_services.dart';

part 'stripe_payment_bloc.freezed.dart';
part 'stripe_payment_event.dart';
part 'stripe_payment_state.dart';

class StripePaymentBloc extends Bloc<StripePaymentEvent, StripePaymentState> {
  StripePaymentBloc() : super(const StripePaymentState.initial()) {
    on<_StripePaymentInitializePayment>(_onInitializePyamentEvent);
  }

  Future<void> _onInitializePyamentEvent(_StripePaymentInitializePayment event,
      Emitter<StripePaymentState> emit) async {
    try {
      emit(const StripePaymentState.loading());
      await StripeServices.instance
          .makePayment(amount: event.amount, currency: event.currency);
      print('-----> AFTER STRIPE PAYMENT SERVICE');
      emit(const StripePaymentState.success());
    } catch (e) {
      emit(StripePaymentState.error(errorMessage: e.toString()));
    }
  }

}

String stripePublishableKey =
    'pk_test_51PuYgIFVcDu4A3RZ2fL1z1nhZXPdvhjI6keJ4tDC7w22EUjukzB9RM91dVKfgvgE0Zihw6D3mrxbUyuIoEWeUT0M001ECjRJGi';
String secretKey =
    'sk_test_51PuYgIFVcDu4A3RZHxIg9RivqCqV0znl5xNzj8HETzIzw3BAOk8UB3O2hkHyGGt3X2piFys2jtPXYNiMpawTMLg700km2gSdAO';

