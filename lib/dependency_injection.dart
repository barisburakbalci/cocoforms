import 'package:cocoforms/core/logic/auth_service.dart';
import 'package:cocoforms/providers/auth_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:cocoforms/data/database_service.dart';
import 'package:cocoforms/data/repositories/folder_repository.dart';
import 'package:cocoforms/data/repositories/form_repository.dart';
import 'package:cocoforms/providers/folder_provider.dart';
import 'package:cocoforms/providers/form_provider.dart';
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
  getIt.registerSingleton<AuthProvider>(AuthProvider(GoogleCloudAuthService()));
  getIt.registerSingleton<AuthService>(GoogleCloudAuthService());
}
