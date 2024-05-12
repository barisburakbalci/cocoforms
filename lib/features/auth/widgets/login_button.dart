import 'package:cocoforms/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    if (authService.user.isNotEmpty) {
      Future.microtask(() {
        return Navigator.pushReplacementNamed(
          context,
          '/forms',
        );
      });
    }

    return ElevatedButton(
      onPressed: () async {
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
