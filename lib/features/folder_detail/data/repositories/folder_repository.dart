import 'package:cocoforms/core/data/repositories/repository.dart';
import 'package:cocoforms/features/folder_detail/data/models/folder_model.dart';
import 'package:cocoforms/objectbox.g.dart';

class FolderRepository implements Repository<FolderModel> {
  final Store _db;
  late final Box<FolderModel> _folderBox;

  FolderRepository(this._db) {
    _folderBox = _db.box<FolderModel>();
  }

  @override
  Future<FolderModel?> getOne(int id) async {
    return _folderBox.get(id);
  }

  @override
  Future<List<FolderModel>> getAll() async {
    List<FolderModel> folders = _folderBox.getAll();
    return folders;
  }

  @override
  Future<bool> insert(FolderModel folder) async {
    return _folderBox.put(folder) > 0;
  }

  @override
  Future<bool> delete(int id) async {
    return _folderBox.remove(id);
  }

  @override
  Future<bool> update(FolderModel folder) async {
    return _folderBox.put(folder) > 0;
  }

  @override
  Future<bool> deleteAll() async {
    return _folderBox.removeAll() > 0;
  }
}
