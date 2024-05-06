import 'package:cocoforms/core/logic/auth_service.dart';
import 'package:cocoforms/core/models/auth_user_model.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  AuthUserModel? _currentUser;
  final AuthService _authService;

  AuthUserModel? get currentUser => _currentUser;

  AuthProvider(this._authService);

  Future<void> login() async {
    if (await _authService.signIn()) {
      _currentUser = await _authService.getUser();
      notifyListeners();
    }
  }

  Future<void> clearCurrentUser() async {
    if (await _authService.signOut()) {
      _currentUser = null;
      notifyListeners();
    }
    notifyListeners();
  }
}
