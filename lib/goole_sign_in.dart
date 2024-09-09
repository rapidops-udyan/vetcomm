import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() async {
    try {
      return await _googleSignIn.signIn();
    } catch (error) {
      print('Error signing in: $error');
      return null;
    }
  }

  static Future<void> logout() async {
    try {
      await _googleSignIn.disconnect();
    } catch (error) {
      print('Error signing out: $error');
    }
  }

  static GoogleSignInAccount? get currentUser => _googleSignIn.currentUser;
}
