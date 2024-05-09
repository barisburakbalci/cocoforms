import 'package:cocoforms/features/auth/services/auth_service.dart';
import 'package:cocoforms/core/services/preference_service.dart';
import 'package:get_it/get_it.dart';
import 'package:cocoforms/data/database_service.dart';
import 'package:cocoforms/data/repositories/folder_repository.dart';
import 'package:cocoforms/data/repositories/form_repository.dart';
import 'package:cocoforms/providers/folder_provider.dart';
import 'package:cocoforms/providers/form_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerSingleton<Database>(await DatabaseService().database);
  getIt
      .registerSingleton<FormRepository>(FormRepository(getIt.get<Database>()));
  getIt.registerSingleton<FolderRepository>(
      FolderRepository(getIt.get<Database>()));
  getIt.registerSingleton<FormProvider>(
      FormProvider(getIt.get<FormRepository>()));
  getIt.registerSingleton<FolderProvider>(
      FolderProvider(getIt.get<FolderRepository>()));
  getIt.registerSingleton<PreferenceService>(
      PreferenceService(await SharedPreferences.getInstance()));
  getIt.registerSingleton<AuthService>(
      GoogleCloudAuthService(getIt.get<PreferenceService>()));
}
