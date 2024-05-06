import 'package:cocoforms/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, ref, child) {
      if (ref.currentUser != null) {
        return Text(ref.currentUser!.displayName);
      }
      return const Text('Yetkisiz kullanıcı');
    });
  }
}
