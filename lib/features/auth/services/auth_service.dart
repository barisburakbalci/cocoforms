import 'package:cocoforms/features/auth/models/auth_user_model.dart';

abstract class AuthService {
  Future<bool> signIn();
  Future<bool> signOut();
  Future<AuthUserModel> getUser();
  AuthUserModel? get user;
}
