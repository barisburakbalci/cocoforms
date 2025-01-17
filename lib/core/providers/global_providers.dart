import 'package:cocoforms/core/data/objectbox.dart';
import 'package:cocoforms/core/services/preference_service.dart';
import 'package:cocoforms/features/folder/data/repositories/folder_repository.dart';
import 'package:cocoforms/features/folder/providers/folder_provider.dart';
import 'package:cocoforms/features/form/data/repositories/answer_repository.dart';
import 'package:cocoforms/features/form/data/repositories/option_repository.dart';
import 'package:cocoforms/features/form/data/repositories/question_repository.dart';
import 'package:cocoforms/features/form/providers/answer_provider.dart';
import 'package:cocoforms/features/form/providers/option_provider.dart';
import 'package:cocoforms/features/form/providers/question_provider.dart';
import 'package:cocoforms/features/form/data/repositories/form_repository.dart';
import 'package:cocoforms/features/auth/services/auth_service.dart';
import 'package:cocoforms/features/auth/services/google_cloud_auth_service.dart';
import 'package:cocoforms/features/form/providers/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({super.key, required Widget child}) : _child = child;
  final Widget _child;

  Future<MultiProvider> setupDependencies() async {
    final sharedPreferencesInstance = await SharedPreferences.getInstance();
    await ObjectBox.create();
    final store = ObjectBox.store!;

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
        Provider<FormRepository>(
          create: (_) => FormRepository(store),
        ),
        Consumer<FormRepository>(
          builder: (_, formRepository, child) =>
              ChangeNotifierProvider<FormChangeNotifier>(
            create: (_) => FormChangeNotifier(
              formRepository: formRepository,
            ),
            child: child,
          ),
        ),
        Provider<FolderRepository>(
          create: (_) => FolderRepository(store),
        ),
        Consumer<FolderRepository>(
          builder: (_, folderRepository, child) =>
              ChangeNotifierProvider<FolderChangeNotifier>(
            create: (_) => FolderChangeNotifier(
              folderRepository: folderRepository,
            ),
            child: child,
          ),
        ),
        Provider<QuestionRepository>(
          create: (_) => QuestionRepository(store),
        ),
        Consumer<QuestionRepository>(
          builder: (_, questionRepository, child) =>
              ChangeNotifierProvider<QuestionChangeNotifier>(
            create: (_) => QuestionChangeNotifier(
              questionRepository: questionRepository,
            ),
            child: child,
          ),
        ),
        Provider<OptionRepository>(
          create: (_) => OptionRepository(store),
        ),
        Consumer<OptionRepository>(
          builder: (_, optionRepository, child) =>
              ChangeNotifierProvider<OptionChangeNotifier>(
            create: (_) => OptionChangeNotifier(
              optionRepository: optionRepository,
            ),
            child: child,
          ),
        ),
        Provider<AnswerRepository>(
          create: (_) => AnswerRepository(store),
        ),
        Consumer<AnswerRepository>(
          builder: (_, answerRepository, child) =>
              ChangeNotifierProvider<AnswerChangeNotifier>(
            create: (_) => AnswerChangeNotifier(
              answerRepository: answerRepository,
            ),
            child: child,
          ),
        )
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
                  child: Text('Uygulama yüklenemedi!'),
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
