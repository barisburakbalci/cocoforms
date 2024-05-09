import 'package:cocoforms/features/form_view/models/form_model.dart';
import 'package:sqflite/sqflite.dart';

class FormRepository {
  final Database _db;
  final String tableName = 'forms';

  FormRepository(this._db);

  Future<List<FormModel>> get() async {
    final rawForms = await _db.query(tableName);
    final forms = rawForms.map((e) => FormModel.fromMap(e)).toList();
    return forms;
  }

  Future<bool> insert(FormModel form) async {
    return await _db.insert(tableName, form.toMap()) > 0;
  }

  Future<bool> delete(FormModel form) async {
    return await _db.delete(tableName, where: 'id = ?', whereArgs: [form.id]) >
        0;
  }

  Future<bool> update(FormModel form) async {
    return await _db.update(tableName, form.toMap(),
            where: 'id = ?', whereArgs: [form.id]) >
        0;
  }

  Future<bool> deleteAll() async {
    return await _db.delete(tableName) > 0;
  }
}
