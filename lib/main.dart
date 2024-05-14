import 'package:cocoforms/core/providers/global_providers.dart';
import 'package:cocoforms/core/views/app_screen.dart';
import 'package:cocoforms/features/auth/services/auth_service.dart';
import 'package:cocoforms/features/auth/views/login_screen.dart';
import 'package:cocoforms/theme.dart';
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
            initialRoute = '/app';
          }
          return MaterialApp(
            title: 'Ticform',
            theme: theme,
            routes: {
              '/login': (context) => const LoginScreen(),
              '/app': (context) => const AppScreen(),
            },
            initialRoute: initialRoute,
          );
        },
      ),
    );
  }
}
