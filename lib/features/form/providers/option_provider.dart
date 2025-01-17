import 'package:cocoforms/features/form/data/models/option_model.dart';
import 'package:cocoforms/features/form/data/repositories/option_repository.dart';
import 'package:flutter/material.dart';

class OptionChangeNotifier with ChangeNotifier {
  final OptionRepository _optionRepository;

  final List<OptionModel> _options = [];
  List<OptionModel> get options {
    return _options;
  }

  OptionChangeNotifier({required OptionRepository optionRepository})
      : _optionRepository = optionRepository;

  Future<List<OptionModel>> getAll() async {
    _options.clear();
    _options.addAll(await _optionRepository.getAll());
    notifyListeners();
    return _options;
  }

  Future<void> add(OptionModel option) async {
    _options.add(option);
    await _optionRepository.insert(option);
    notifyListeners();
  }

  Future<void> update(OptionModel option) async {
    _options.removeWhere((element) => element.id == option.id);
    _options.add(option);
    await _optionRepository.update(option);
    notifyListeners();
  }

  Future<void> delete(int id) async {
    _options.removeWhere((element) => element.id == id);
    await _optionRepository.delete(id);
    notifyListeners();
  }

  Future<void> deleteAll() async {
    await _optionRepository.deleteAll();
    _options.clear();
    notifyListeners();
  }
}
