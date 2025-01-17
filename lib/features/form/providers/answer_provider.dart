import 'package:cocoforms/features/form/data/models/answer_model.dart';
import 'package:cocoforms/features/form/data/repositories/answer_repository.dart';
import 'package:flutter/material.dart';

class AnswerChangeNotifier with ChangeNotifier {
  final AnswerRepository _answerRepository;

  final List<AnswerModel> _answers = [];
  List<AnswerModel> get answers {
    return _answers;
  }

  AnswerChangeNotifier({required AnswerRepository answerRepository})
      : _answerRepository = answerRepository;

  Future<List<AnswerModel>> getAll() async {
    _answers.clear();
    _answers.addAll(await _answerRepository.getAll());
    notifyListeners();
    return _answers;
  }

  Future<void> add(AnswerModel answer) async {
    _answers.add(answer);
    await _answerRepository.insert(answer);
    notifyListeners();
  }

  Future<void> update(AnswerModel answer) async {
    _answers.removeWhere((element) => element.id == answer.id);
    _answers.add(answer);
    await _answerRepository.update(answer);
    notifyListeners();
  }

  Future<void> delete(int id) async {
    _answers.removeWhere((element) => element.id == id);
    await _answerRepository.delete(id);
    notifyListeners();
  }

  Future<void> deleteAll() async {
    await _answerRepository.deleteAll();
    _answers.clear();
    notifyListeners();
  }
}
