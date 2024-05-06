import 'package:cocoforms/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, ref, child) {
        return ElevatedButton(
          onPressed: () async {
            final authProvider = context.read<AuthProvider>();
            await authProvider.login();
            if (authProvider.currentUser != null && context.mounted) {
              Navigator.pushNamed(context, '/forms');
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
      },
    );
  }
}
