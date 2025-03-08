import 'package:cocoforms/core/data/repositories/repository.dart';
import 'package:cocoforms/features/form/data/models/option_model.dart';
import 'package:cocoforms/objectbox.g.dart';

class OptionRepository implements Repository<OptionModel> {
  final Store _db;
  late final Box<OptionModel> optionBox;

  OptionRepository(this._db) {
    optionBox = _db.box<OptionModel>();
  }

  @override
  Future<OptionModel?> getOne(int id) async {
    return optionBox.get(id);
  }

  @override
  Future<List<OptionModel>> getAll() async {
    return optionBox.getAll();
  }

  @override
  Future<bool> insert(OptionModel option) async {
    return optionBox.put(option) > 0;
  }

  @override
  Future<bool> delete(int id) async {
    return optionBox.remove(id);
  }

  @override
  Future<bool> update(OptionModel option) async {
    return optionBox.put(option) > 0;
  }

  @override
  Future<bool> deleteAll() async {
    return optionBox.removeAll() > 0;
  }
}
