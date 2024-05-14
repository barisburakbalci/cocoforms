import 'package:cocoforms/features/auth/services/auth_service.dart';
import 'package:cocoforms/core/services/preference_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var preferences = Provider.of<PreferenceService>(context, listen: false);
    var userName = preferences.getString('user');

    if (userName.isNotEmpty) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(userName),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await Provider.of<AuthService>(context, listen: false).signOut();
              if (context.mounted) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          )
        ],
      );
    }

    return const Text('Yetkisiz kullanıcı');
  }
}
