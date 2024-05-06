import 'package:cocoforms/core/models/auth_user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthService {
  Future<bool> signIn();
  Future<bool> signOut();
  Future<AuthUserModel> getUser();
}

class GoogleCloudAuthService implements AuthService {
  AuthUserModel? _user;

  @override
  Future<AuthUserModel> getUser() async {
    if (_user != null) {
      return _user!;
    }
    throw Exception('User not logged in');
  }

  @override
  Future<bool> signIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: ['email'],
    );

    GoogleSignInAccount? user = await googleSignIn.signIn();

    if (user != null) {
      _user = AuthUserModel(
        email: user.email,
        displayName: user.displayName ?? '',
        photoURL: user.photoUrl ?? '',
      );

      return true;
    }

    return false;
  }

  @override
  Future<bool> signOut() async {
    if (_user == null) {
      return false;
    }

    await GoogleSignIn().signOut();
    _user = null;

    return true;
  }
}
