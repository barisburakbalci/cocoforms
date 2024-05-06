import 'package:cocoforms/core/services/auth_service.dart';
import 'package:cocoforms/dependency_injection.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final authService = getIt.get<AuthService>();

        if (await authService.signIn() && context.mounted) {
          Navigator.pushReplacementNamed(context, '/forms');
        } else if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Giriş yapılamadı'),
            ),
          );
        }
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            image: AssetImage('assets/google-icon.png'),
            width: 20,
          ),
          SizedBox(width: 10),
          Text('Google ile giriş yap'),
        ],
      ),
    );
  }
}
