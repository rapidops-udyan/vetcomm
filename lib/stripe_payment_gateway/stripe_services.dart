import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  StripeServices._();

  static final StripeServices instance = StripeServices._();

  Dio dio = Dio();
  var paymentIntent;

  Future<void> makePayment({
    required double amount,
    required String currency,
  }) async {
    try {
      paymentIntent = await _createPaymentIntent(
        amount: amount,
        currency: currency,
      );
      if (paymentIntent != null) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            customFlow: true,
            paymentIntentClientSecret: paymentIntent['client_secret'],
            merchantDisplayName: "Vet comm",
            googlePay: const PaymentSheetGooglePay(
              merchantCountryCode: 'US',
              testEnv: true,
            ),
          ),
        );
        await _processPayment();
      }
      return;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _processPayment() async {
    try {
      await Stripe.instance.presentPaymentSheet();

      // then(
      //   (value) {
      //     print('----------> VALUE AFTER PAYMENT SHEET: $value}');
      //     paymentIntent = null;
      //   },
      // ).onError((error, stackTrace) {
      //   print('INSIDE THE CATCH BLOCK OF THE PAYMENT SHEET DISPLAY');
      //   print('------> ERROR : \n  $error');
      //   print('----> STACK TRACE : \n $stackTrace');
      //   throw Exception(error);
      // });
      Stripe.instance
          .confirmPaymentSheetPayment()
          .then(
            (value) {},
          )
          .onError(
        (error, stackTrace) {
          print('insinde the error bloc, ');
          throw Exception(error);
        },
      );
    } on StripeException catch (e) {
      print(' STRIPE Error is:---> $e');
      throw Exception(e);
    } catch (e) {
      print('INSIDE THE EXCEPTION BLOC');
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>?> _createPaymentIntent({
    required double amount,
    required String currency,
  }) async {
    try {
      Map<String, dynamic> data = {
        "amount": calculateAmount(amount),
        "currency": 'usd',
      };

      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Authorization": "Bearer $secretKey",
            "Content-Type": 'application/x-www-form-urlencoded',
          },
        ),
      );
      if (response.data != null) {
        return response.data;
      }
      return null;
    } catch (e) {
      // DioException err = e as DioException;
      // print('-----> Response is  : ${err.response}');

      print('-----> EXCEPTION OCCURED WHILE PAYMENT INTENT CREATION : ${e}');
      throw Exception(e);
    }
    return null;
  }

  int calculateAmount(double amount) {
    int result = (amount * 100).toInt();
    return result;
  }
}

String stripePublishableKey =
    'pk_test_51PuYgIFVcDu4A3RZ2fL1z1nhZXPdvhjI6keJ4tDC7w22EUjukzB9RM91dVKfgvgE0Zihw6D3mrxbUyuIoEWeUT0M001ECjRJGi';
String secretKey =
    'sk_test_51PuYgIFVcDu4A3RZHxIg9RivqCqV0znl5xNzj8HETzIzw3BAOk8UB3O2hkHyGGt3X2piFys2jtPXYNiMpawTMLg700km2gSdAO';
