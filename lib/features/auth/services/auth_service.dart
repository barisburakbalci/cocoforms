import 'package:cocoforms/features/auth/models/auth_user_model.dart';
import 'package:cocoforms/core/services/preference_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthService {
  Future<bool> signIn();
  Future<bool> signOut();
  Future<AuthUserModel> getUser();
  String get user;
}

class GoogleCloudAuthService implements AuthService {
  AuthUserModel? _user;
  final PreferenceService _preferenceService;

  @override
  String get user => _preferenceService.getString('user');

  GoogleCloudAuthService(this._preferenceService);

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
      _preferenceService.setString('user', user.displayName ?? user.email);
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

    _preferenceService.setString('user', '');
    await GoogleSignIn().signOut();
    _user = null;

    return true;
  }
}
