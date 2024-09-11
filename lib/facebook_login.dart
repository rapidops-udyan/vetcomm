import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookLogin extends StatefulWidget {
  const FacebookLogin({super.key});

  @override
  State<FacebookLogin> createState() => _FacebookLoginState();
}

class _FacebookLoginState extends State<FacebookLogin> {
  Map<String, dynamic>? _userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook Login'),
      ),
      body: Center(
        child: _userData == null
            ? ElevatedButton(
                onPressed: facebookLogin,
                child: const Text('Login with Facebook'),
              )
            : _buildUserDetails(),
      ),
    );
  }

  Future<void> facebookLogin() async {
    final result =
        await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.i.getUserData();
      setState(() {
        _userData = userData;
      });
    } else {
      print('Failed to login');
    }
  }

  facebookLogout() async {
    await FacebookAuth.i.logOut();
    setState(() {
      _userData = null;
    });
  }

  Widget _buildUserDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _userData!['picture']['data']['is_silhouette'] == false
            ? CircleAvatar(
                backgroundImage:
                    NetworkImage(_userData!['picture']['data']['url']),
                radius: 50,
              )
            : const Icon(Icons.account_circle, size: 50),
        const SizedBox(height: 10),
        Text(
          _userData!['name'] ?? 'No Name',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Text(
          _userData!['email'] ?? 'No Email',
          style: const TextStyle(fontSize: 16),
        ),
        ElevatedButton(
          onPressed: facebookLogout,
          child: const Text('Logout'),
        ),
      ],
    );
  }
}
