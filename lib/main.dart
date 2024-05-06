import 'package:cocoforms/core/screens/forms_screen.dart';
import 'package:cocoforms/core/screens/login_screen.dart';
import 'package:cocoforms/core/services/auth_service.dart';
import 'package:cocoforms/providers/folder_provider.dart';
import 'package:cocoforms/providers/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cocoforms/dependency_injection.dart';

void main() {
  runApp(const Ticform());
}

class Ticform extends StatelessWidget {
  const Ticform({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: setupDependencies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var initialRoute = '/login';
          var authService = getIt.get<AuthService>();

          if (authService.user.isNotEmpty) {
            initialRoute = '/forms';
          }

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => getIt.get<FormProvider>(),
              ),
              ChangeNotifierProvider(
                create: (context) => getIt.get<FolderProvider>(),
              ),
            ],
            child: MaterialApp(
              title: 'CocoForms',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              routes: {
                '/login': (context) => const LoginScreen(),
                '/forms': (context) => const FormsScreen(),
              },
              initialRoute: initialRoute,
            ),
          );
        }
        return const MaterialApp(
          title: 'CocoForms',
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircularProgressIndicator(),
                  Text('Veritabanı yükleniyor...'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
