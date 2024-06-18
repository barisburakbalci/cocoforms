import 'package:cocoforms/core/data/repositories/repository.dart';
import 'package:cocoforms/features/form_list/data/models/form_model.dart';
import 'package:cocoforms/objectbox.g.dart';

class FormRepository implements Repository<FormModel> {
  final Store _db;
  late final Box<FormModel> _formBox;

  FormRepository(this._db) {
    _formBox = _db.box<FormModel>();
  }

  @override
  Future<FormModel?> getOne(int id) async {
    return _formBox.get(id);
  }

  @override
  Future<List<FormModel>> getAll() async {
    List<FormModel> forms = _formBox.getAll();
    return forms;
  }

  @override
  Future<bool> insert(FormModel form) async {
    return _formBox.put(form) > 0;
  }

  @override
  Future<bool> delete(int id) async {
    return _formBox.remove(id);
  }

  @override
  Future<bool> update(FormModel form) async {
    return _formBox.put(form) > 0;
  }

  @override
  Future<bool> deleteAll() async {
    return _formBox.removeAll() > 0;
  }
}
