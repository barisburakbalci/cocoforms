import 'package:cocoforms/core/services/global_providers.dart';
import 'package:cocoforms/features/auth/services/auth_service.dart';
import 'package:cocoforms/features/form_view/screens/forms_screen.dart';
import 'package:cocoforms/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Ticform());
}

class Ticform extends StatelessWidget {
  const Ticform({super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalProviders(
      child: Consumer<AuthService>(
        builder: (_, authService, __) {
          String initialRoute = '/login';
          if (authService.user.isNotEmpty) {
            initialRoute = '/forms';
          }
          return MaterialApp(
            title: 'Ticform',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: {
              '/login': (context) => const LoginScreen(),
              '/forms': (context) => const FormsScreen(),
            },
            initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
