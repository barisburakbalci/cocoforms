import 'package:cocoforms/features/form/data/models/option_model.dart';
import 'package:cocoforms/features/form/data/repositories/option_repository.dart';
import 'package:flutter/material.dart';

class OptionChangeNotifier with ChangeNotifier {
  final OptionRepository _optionRepository;

  List<OptionModel> _options = [];
  List<OptionModel> get options {
    return _options;
  }

  OptionChangeNotifier({required OptionRepository optionRepository})
      : _optionRepository = optionRepository {
    getAll();
  }

  Future<void> getAll() async {
    _options = await _optionRepository.getAll();
    notifyListeners();
  }

  List<OptionModel> getByQuestionId(int questionId) {
    return _options.where((element) {
      return element.question.target?.id == questionId;
    }).toList();
  }

  Future<void> add(OptionModel option) async {
    _options.add(option);
    if (!option.isTemporary) {
      await _optionRepository.insert(option);
    }
    notifyListeners();
  }

  Future<void> update(OptionModel option) async {
    _options.removeWhere((element) => element.id == option.id);
    _options.add(option);
    await _optionRepository.update(option);
    notifyListeners();
  }

  Future<void> delete(OptionModel option) async {
    _options.remove(option);
    if (!option.isTemporary) {
      await _optionRepository.delete(option.id);
    }
    notifyListeners();
  }

  Future<void> deleteAll() async {
    await _optionRepository.deleteAll();
    _options.clear();
    notifyListeners();
  }
}
