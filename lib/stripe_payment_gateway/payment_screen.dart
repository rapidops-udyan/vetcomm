import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/stripe_payment_bloc.dart';
import 'succes_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController amountTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var message = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StripePaymentBloc(),
      child: Builder(builder: (context) {
        return BlocListener<StripePaymentBloc, StripePaymentState>(
          listenWhen: (previous, current) =>
              current is StripePaymentSuccessState ||
              current is StripePaymentErrorState,
          listener: (context, state) {
            if (state is StripePaymentSuccessState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentSuccessScreen(),
                  ));
            } else if (state is StripePaymentErrorState) {
              showDialog(
                context: context,
                builder: (context) => const Dialog(
                  backgroundColor: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red,
                          child: Icon(
                            Icons.cancel_outlined,
                            size: 30,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Payment failed',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Checkout Screen'),
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurple,
            ),
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white.withOpacity(0.2),
                    border: Border.all(color: Colors.deepPurple),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ]),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Amount'),
                      const SizedBox(
                        height: 8,
                      ),
                      _buildTextField(),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildPayButton(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  _buildTextField() {
    return TextFormField(
      controller: amountTextController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(8.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        LengthLimitingTextInputFormatter(12),
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
      ],
      onChanged: (value) {
        setState(() {
          message = value;
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a value';
        }
        if (value.length > 12) {
          return 'Maximum 12 characters allowed';
        }
        if (!RegExp(r'^\d+\.?\d{0,2}$').hasMatch(value)) {
          return 'Enter a valid number with up to 2 decimal places';
        }
        return null;
      },
    );
  }

  Widget _buildPayButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            message.isNotEmpty ? 'PAY: \$ $message' : "",
            style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w500,
                fontSize: 18),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        FilledButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Proceed with payment
              final amount = double.parse(amountTextController.text);
              print('-------> amount is $amount');
              context
                  .read<StripePaymentBloc>()
                  .add(StripePaymentEvent.initializePayment(amount: amount));
            }
          },
          style: FilledButton.styleFrom(backgroundColor: Colors.green),
          child: const Text('Pay'),
        ),
      ],
    );
  }
}
