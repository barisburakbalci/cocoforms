import 'package:cocoforms/core/data/repositories/repository.dart';
import 'package:cocoforms/features/form/data/models/option_model.dart';
import 'package:cocoforms/objectbox.g.dart';

class OptionRepository implements Repository<OptionModel> {
  final Store _db;
  late final Box<OptionModel> _questionBox;

  OptionRepository(this._db) {
    _questionBox = _db.box<OptionModel>();
  }

  @override
  Future<OptionModel?> getOne(int id) async {
    return _questionBox.get(id);
  }

  @override
  Future<List<OptionModel>> getAll() async {
    return _questionBox.getAll();
  }

  @override
  Future<bool> insert(OptionModel form) async {
    return _questionBox.put(form) > 0;
  }

  @override
  Future<bool> delete(int id) async {
    return _questionBox.remove(id);
  }

  @override
  Future<bool> update(OptionModel form) async {
    return _questionBox.put(form) > 0;
  }

  @override
  Future<bool> deleteAll() async {
    return _questionBox.removeAll() > 0;
  }
}
