import 'package:cocoforms/core/services/preference_service.dart';
import 'package:cocoforms/data/data_service.dart';
import 'package:cocoforms/data/database_service.dart';
import 'package:cocoforms/data/repositories/form_repository.dart';
import 'package:cocoforms/data/sqlite_data_service.dart';
import 'package:cocoforms/features/auth/services/auth_service.dart';
import 'package:cocoforms/features/auth/services/google_cloud_auth_service.dart';
import 'package:cocoforms/providers/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({super.key, required Widget child}) : _child = child;
  final Widget _child;

  Future<MultiProvider> setupDependencies() async {
    final sharedPreferencesInstance = await SharedPreferences.getInstance();
    final dataBase = await SqliteDatabaseService().database;

    return MultiProvider(
      providers: [
        Provider<PreferenceService>(
          create: (_) => PreferenceService(
            preferences: sharedPreferencesInstance,
          ),
        ),
        Consumer<PreferenceService>(
          builder: (_, preferenceService, child) => Provider<AuthService>(
            create: (_) => GoogleCloudAuthService(
              preferenceService: preferenceService,
            ),
            child: child,
          ),
        ),
        Provider<DataService>(
          create: (_) => SqliteDataService(
            database: dataBase,
          ),
        ),
        Consumer<DataService>(
          builder: (_, dataService, child) => MultiProvider(
            providers: [
              Provider<FormRepository>(
                create: (_) => FormRepository(
                  dataService: dataService,
                ),
              ),
              Consumer<FormRepository>(
                builder: (_, formRepository, child) =>
                    ChangeNotifierProvider<FormChangeNotifier>(
                  create: (_) => FormChangeNotifier(
                    formRepository: formRepository,
                  ),
                  child: child,
                ),
              )
              // TODO: add folder rpository
            ],
            child: child,
          ),
        ),
      ],
      child: _child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MultiProvider>(
      future: setupDependencies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return snapshot.data!;
          } else {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(),
                        Text('Uygulama yüklenemedi!'),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        }
        return const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Text('Uygulama yükleniyor...'),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
