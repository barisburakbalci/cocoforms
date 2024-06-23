import 'package:cocoforms/features/form_edit/data/models/question_model.dart';
import 'package:cocoforms/features/form_list/data/models/form_model.dart';
import 'package:cocoforms/features/form_list/data/repositories/form_repository.dart';
import 'package:flutter/material.dart';

class FormChangeNotifier with ChangeNotifier {
  final FormRepository _formRepository;

  List<FormModel> _forms = [];
  List<FormModel> get forms {
    return _forms;
  }

  FormChangeNotifier({required FormRepository formRepository})
      : _formRepository = formRepository {
    getAll();
  }

  Future<void> getAll() async {
    _forms = await _formRepository.getAll();
    notifyListeners();
  }

  Future<void> add(FormModel form) async {
    await _formRepository.insert(form);
    await getAll();
    notifyListeners();
  }

  Future<void> delete(FormModel form) async {
    await _formRepository.delete(form.id);
    await getAll();
    notifyListeners();
  }

  Future<void> update(FormModel form) async {
    await _formRepository.update(form);
    await getAll();
    notifyListeners();
  }

  Future<void> addQuestion(FormModel form, QuestionModel question) async {
    form.questions.add(question);
    await _formRepository.insert(form);
    await getAll();
    notifyListeners();
  }
}
