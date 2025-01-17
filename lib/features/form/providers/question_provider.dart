import 'package:cocoforms/features/form/data/models/option_model.dart';
import 'package:cocoforms/features/form/data/models/question_model.dart';
import 'package:cocoforms/features/form/data/repositories/question_repository.dart';
import 'package:flutter/material.dart';

class QuestionChangeNotifier with ChangeNotifier {
  final QuestionRepository _questionRepository;

  final List<QuestionModel> _questions = [];
  List<QuestionModel> get questions {
    return _questions;
  }

  QuestionChangeNotifier({required QuestionRepository questionRepository})
      : _questionRepository = questionRepository;

  Future<List<QuestionModel>> getAll() async {
    _questions.clear();
    _questions.addAll(await _questionRepository.getAll());
    notifyListeners();
    return _questions;
  }

  Future<void> add(QuestionModel question) async {
    _questions.add(question);
    await _questionRepository.insert(question);
    notifyListeners();
  }

  Future<void> update(QuestionModel question) async {
    _questions.removeWhere((element) => element.id == question.id);
    _questions.add(question);
    await _questionRepository.update(question);
    notifyListeners();
  }

  Future<void> delete(int id) async {
    _questions.removeWhere((element) => element.id == id);
    await _questionRepository.delete(id);
    notifyListeners();
  }

  Future<void> deleteAll() async {
    await _questionRepository.deleteAll();
    _questions.clear();
    notifyListeners();
  }

  Future<void> addOption(QuestionModel question, OptionModel option) async {
    question.options.add(option);
    await _questionRepository.update(question);
    await getAll();
    notifyListeners();
  }
}
