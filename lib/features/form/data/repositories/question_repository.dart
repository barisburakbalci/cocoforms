import 'package:cocoforms/core/data/repositories/repository.dart';
import 'package:cocoforms/features/form/data/models/question_model.dart';
import 'package:cocoforms/objectbox.g.dart';

class QuestionRepository implements Repository<QuestionModel> {
  final Store _db;
  late final Box<QuestionModel> _questionBox;

  QuestionRepository(this._db) {
    _questionBox = _db.box<QuestionModel>();
  }

  @override
  Future<QuestionModel?> getOne(int id) async {
    return _questionBox.get(id);
  }

  @override
  Future<List<QuestionModel>> getAll() async {
    return _questionBox.getAll();
  }

  @override
  Future<bool> insert(QuestionModel form) async {
    return _questionBox.put(form) > 0;
  }

  @override
  Future<bool> delete(int id) async {
    return _questionBox.remove(id);
  }

  @override
  Future<bool> update(QuestionModel form) async {
    return _questionBox.put(form) > 0;
  }

  @override
  Future<bool> deleteAll() async {
    return _questionBox.removeAll() > 0;
  }
}
