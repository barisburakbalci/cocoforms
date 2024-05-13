import 'package:cocoforms/data/data_service.dart';
import 'package:sqflite/sqflite.dart';

class SqliteDataService implements DataService {
  String databaseName = 'cocoforms.db';
  final Database _database;

  SqliteDataService({required Database database}) : _database = database;

  @override
  Future<bool> delete(String modelName, int id) async {
    return await _database.delete(
          modelName,
          where: 'id = ?',
          whereArgs: [id],
        ) >
        0;
  }

  @override
  Future<Map<String, dynamic>> find(String modelName, int id) async {
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
    return _database.query(entityName);
  }

  @override
  Future<bool> insert(String modelName, Map<String, dynamic> model) async {
    return await _database.insert(modelName, model) > 0;
  }

  @override
  Future<bool> update(
      String modelName, int id, Map<String, dynamic> model) async {
    return await _database.update(
          modelName,
          model,
          where: 'id = ?',
          whereArgs: [id],
        ) >
        0;
  }
}
