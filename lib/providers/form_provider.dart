import 'package:cocoforms/features/form_view/models/form_model.dart';
import 'package:cocoforms/data/repositories/form_repository.dart';
import 'package:flutter/material.dart';

class FormChangeNotifier with ChangeNotifier {
  final FormRepository _formRepository;

  List<FormModel> _forms = [];
  List<FormModel> get forms {
    return _forms;
  }

  FormChangeNotifier(this._formRepository) {
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
    await _formRepository.delete(form);
    await getAll();
    notifyListeners();
  }

  Future<void> update(FormModel form) async {
    await _formRepository.update(form);
    await getAll();
    notifyListeners();
  }
}
