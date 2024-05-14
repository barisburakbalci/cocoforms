import 'package:cocoforms/features/folder_detail/data/models/folder_model.dart';
import 'package:sqflite/sqflite.dart';

class FolderRepository {
  final Database _db;
  final String tableName = 'folders';

  FolderRepository(this._db);

  Future<List<FolderModel>> get() async {
    final rawFolders = await _db.query(tableName);
    final folders = rawFolders.map((e) => FolderModel.fromMap(e)).toList();
    return folders;
  }

  Future<bool> insert(FolderModel folder) async {
    return await _db.insert(tableName, folder.toMap()) > 0;
  }

  Future<bool> delete(FolderModel folder) async {
    return await _db
            .delete(tableName, where: 'id = ?', whereArgs: [folder.id]) >
        0;
  }

  Future<bool> update(FolderModel folder) async {
    return await _db.update(tableName, folder.toMap(),
            where: 'id = ?', whereArgs: [folder.id]) >
        0;
  }

  Future<bool> deleteAll() async {
    return await _db.delete(tableName) > 0;
  }
}
