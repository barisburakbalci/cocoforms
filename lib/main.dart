import 'package:cocoforms/core/screens/forms_screen.dart';
import 'package:cocoforms/core/screens/login_screen.dart';
import 'package:cocoforms/providers/auth_provider.dart';
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
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => getIt.get<FormProvider>(),
              ),
              ChangeNotifierProvider(
                create: (context) => getIt.get<FolderProvider>(),
              ),
              ChangeNotifierProvider(
                create: (context) => getIt.get<AuthProvider>(),
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
              initialRoute: '/login',
              home: const LoginScreen(),
            ),
          );
        }
        return const MaterialApp(
          title: 'CocoForms',
          home: Scaffold(
            body: Center(
              child: Column(
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
