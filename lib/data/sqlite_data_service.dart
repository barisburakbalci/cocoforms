import 'package:cocoforms/data/data_service.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDataService implements DataService {
  String databaseName = 'cocoforms.db';
  late Database _database;
  bool _initialized = false;

  Future<void> _initDatabase() async {
    String path = join(await getDatabasesPath(), databaseName);

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );

    if (_database.isOpen) {
      _initialized = true;
    }
  }

  SqliteDataService() {
    _initDatabase();
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

  _ensureInitialized() {
    if (!_initialized) {
      _initDatabase();
    }
  }

  @override
  Future<bool> delete(String modelName, int id) async {
    _ensureInitialized();

    return await _database.delete(
          modelName,
          where: 'id = ?',
          whereArgs: [id],
        ) >
        0;
  }

  @override
  Future<Map<String, dynamic>> find(String modelName, int id) async {
    _ensureInitialized();

    var modelAsList = await _database.query(
      modelName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (modelAsList.isEmpty) {
      return {};
    }

    return modelAsList.first;
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(String entityName) {
    _ensureInitialized();

    return _database.query(entityName);
  }

  @override
  Future<bool> insert(String modelName, Map<String, dynamic> model) async {
    _ensureInitialized();

    return await _database.insert(modelName, model) > 0;
  }

  @override
  Future<bool> update(
      String modelName, int id, Map<String, dynamic> model) async {
    _ensureInitialized();

    return await _database.update(
          modelName,
          model,
          where: 'id = ?',
          whereArgs: [id],
        ) >
        0;
  }
}
