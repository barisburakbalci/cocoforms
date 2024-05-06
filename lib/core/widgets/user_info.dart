import 'package:cocoforms/core/services/auth_service.dart';
import 'package:cocoforms/core/services/preference_service.dart';
import 'package:cocoforms/dependency_injection.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var preferences = getIt.get<PreferenceService>();
    var userName = preferences.getString('user');

    if (userName.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(userName),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              getIt.get<AuthService>().signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          )
        ],
      );
    }

    return const Text('Yetkisiz kullanıcı');
  }
}
