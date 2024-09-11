import 'package:flutter/material.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleSignIn extends StatefulWidget {
  const AppleSignIn({super.key});

  @override
  State<AppleSignIn> createState() => _AppleSignInState();
}

class _AppleSignInState extends State<AppleSignIn> {
  AuthorizationCredentialAppleID? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apple Sign In"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(user?.email ?? "NA"),
          Text(user?.givenName ?? "NA"),
          SignInWithAppleButton(
            onPressed: appleSignIn,
          ),
        ],
      ),
    );
  }

  void appleSignIn() async {
    user = await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ]);
    print(user);
  }
}
