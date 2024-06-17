import 'package:cocoforms/core/services/preference_service.dart';
import 'package:cocoforms/features/auth/models/auth_user_model.dart';
import 'package:cocoforms/features/auth/services/auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleCloudAuthService implements AuthService {
  AuthUserModel? _user;
  final PreferenceService _preferenceService;

  @override
  AuthUserModel? get user {
    if (_preferenceService.getString('user') != '') {
      return AuthUserModel(
        email: _preferenceService.getString('email'),
        displayName: _preferenceService.getString('user'),
        photoURL: _preferenceService.getString('userPhotoURL'),
      );
    }
    return _user;
  }

  GoogleCloudAuthService({required PreferenceService preferenceService})
      : _preferenceService = preferenceService;

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

    GoogleSignInAccount? userAccount = await googleSignIn.signIn();

    if (userAccount != null) {
      _preferenceService.setString('email', userAccount.email);
      _preferenceService.setString(
        'user',
        userAccount.displayName ?? userAccount.email,
      );
      _preferenceService.setString(
        'userPhotoURL',
        userAccount.photoUrl ?? '',
      );
      _user = AuthUserModel(
        email: userAccount.email,
        displayName: userAccount.displayName ?? '',
        photoURL: userAccount.photoUrl ?? '',
      );

      return true;
    }

    return false;
  }

  @override
  Future<bool> signOut() async {
    if (user == null) {
      return false;
    }

    _preferenceService.setString('user', '');
    await GoogleSignIn().signOut();
    _user = null;

    return true;
  }
}
