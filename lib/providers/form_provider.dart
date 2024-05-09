import 'package:cocoforms/features/form_view/models/form_model.dart';
import 'package:cocoforms/data/repositories/form_repository.dart';
import 'package:flutter/material.dart';

class FormProvider extends ChangeNotifier {
  final FormRepository _formRepository;
  bool initialized = false;

  List<FormModel> _forms = [];
  List<FormModel> get forms {
    if (!initialized) {
      getAll();
    }

    return _forms;
  }

  FormProvider(this._formRepository);

  Future<void> getAll() async {
    _forms = await _formRepository.get();
    notifyListeners();
  }

  Future<void> add(FormModel form) async {
    await _formRepository.insert(form);
    notifyListeners();
  }

  Future<void> delete(FormModel form) async {
    await _formRepository.delete(form);
    notifyListeners();
  }

  Future<void> update(FormModel form) async {
    await _formRepository.update(form);
    notifyListeners();
  }

  Future<void> deleteAll() async {
    await _formRepository.deleteAll();
    notifyListeners();
  }
}
