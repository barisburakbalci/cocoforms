import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseService {
  Future<Database> get database;
}

class SqliteDatabaseService extends DatabaseService {
  String databaseName = 'cocoforms.db';
  @override
  Future<Database> get database async {
    String path = join(await getDatabasesPath(), databaseName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE forms (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE folder (
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE folder_user (
        id INTEGER PRIMARY KEY,
        user_id INTEGER,
        folder_id INTEGER,
        FOREIGN KEY(user_id) REFERENCES user(id),
        FOREIGN KEY(folder_id) REFERENCES form(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE form_questions (
        id INTEGER PRIMARY KEY,
        form_id INTEGER,
        expression TEXT,
        FOREIGN KEY(form_id) REFERENCES form(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE question_options (
        id INTEGER PRIMARY KEY,
        question_id INTEGER,
        value TEXT,
        FOREIGN KEY(question_id) REFERENCES question(id)
      )
    ''');
  }
}
