import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'goole_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignInAccount? signIn;

  @override
  void initState() {
    super.initState();
    // Check if the user is already signed in when the screen opens
    signIn = GoogleSignInApi.currentUser;

    // If the user is already signed in, update the UI
    if (signIn != null) {
      setState(() {}); // Trigger a UI rebuild to show logged-in state
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (signIn != null) ...[
                // Show profile image if available, otherwise show the first letter of the display name
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      (signIn?.photoUrl != null && signIn!.photoUrl!.isNotEmpty)
                          ? NetworkImage(signIn!.photoUrl!)
                          : null,
                  backgroundColor: Colors
                      .deepPurple, // No image if photoUrl is null or empty
                  child: (signIn?.photoUrl == null || signIn!.photoUrl!.isEmpty)
                      ? Text(
                          signIn?.displayName?.isNotEmpty == true
                              ? signIn!.displayName![0]
                                  .toUpperCase() // First letter of name
                              : '?', // Fallback if displayName is also null or empty
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      : null, // Background color for avatar when no image
                ),
                const SizedBox(height: 20),
                // Display default text if displayName is null or empty
                Text(
                  signIn?.displayName?.isNotEmpty == true
                      ? signIn!.displayName!
                      : 'No display name',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Display default text if email is null or empty
                Text(
                  signIn?.email.isNotEmpty == true
                      ? signIn!.email
                      : 'No email available',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: googleSignout,
                  icon: const Icon(Icons.logout),
                  label: const Text('Sign Out'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade300,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ] else ...[
                const Text(
                  'Please log in',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: googleSignIn,
                  icon: const Icon(Icons.login),
                  label: const Text('Sign In with Google'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> googleSignIn() async {
    signIn = await GoogleSignInApi.login();
    setState(() {});
  }

  void googleSignout() {
    GoogleSignInApi.logout();
    setState(() {
      signIn = null;
    });
  }
}
