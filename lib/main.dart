import 'package:cocoforms/core/screens/login_screen.dart';
import 'package:cocoforms/providers/folder_provider.dart';
import 'package:cocoforms/providers/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cocoforms/dependency_injection.dart';

void main() {
  runApp(const CocoForms());
}

class CocoForms extends StatelessWidget {
  const CocoForms({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CocoForms',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: setupDependencies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                    create: (context) => getIt.get<FormProvider>()),
                ChangeNotifierProvider(
                    create: (context) => getIt.get<FolderProvider>()),
              ],
              child: const LoginScreen(),
            );
          }
          return const Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                Text('Veritabanı yükleniyor...'),
              ],
            ),
          );
        },
      ),
    );
  }
}
