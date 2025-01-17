import 'package:cocoforms/core/data/repositories/repository.dart';
import 'package:cocoforms/features/form/data/models/answer_model.dart';
import 'package:cocoforms/objectbox.g.dart';

class AnswerRepository implements Repository<AnswerModel> {
  final Store _db;
  late final Box<AnswerModel> _questionBox;

  AnswerRepository(this._db) {
    _questionBox = _db.box<AnswerModel>();
  }

  @override
  Future<AnswerModel?> getOne(int id) async {
    return _questionBox.get(id);
  }

  @override
  Future<List<AnswerModel>> getAll() async {
    return _questionBox.getAll();
  }

  @override
  Future<bool> insert(AnswerModel form) async {
    return _questionBox.put(form) > 0;
  }

  @override
  Future<bool> delete(int id) async {
    return _questionBox.remove(id);
  }

  @override
  Future<bool> update(AnswerModel form) async {
    return _questionBox.put(form) > 0;
  }

  @override
  Future<bool> deleteAll() async {
    return _questionBox.removeAll() > 0;
  }
}
