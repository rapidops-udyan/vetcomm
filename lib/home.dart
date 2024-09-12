import 'package:flutter/material.dart';
import 'package:vetcomm/in_app_purchase_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const InAppPurchaseScreen()));
          },
          child: const Text('In-App Purchase'),
        ),
      ),
    );
  }
}
