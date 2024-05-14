import 'package:cocoforms/features/profile/views/widgets/user_info.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: UserInfo(),
      ),
    );
  }
}
