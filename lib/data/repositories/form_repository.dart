import 'package:cocoforms/data/data_service.dart';
import 'package:cocoforms/data/repositories/repository.dart';
import 'package:cocoforms/features/form_view/models/form_model.dart';

class FormRepository implements Repository<FormModel> {
  final DataService _dataService;
  @override
  final String modelName = 'forms';

  FormRepository({required DataService dataService})
      : _dataService = dataService;

  @override
  Future<bool> insert(FormModel form) async {
    return await _dataService.insert(modelName, form.toMap());
  }

  @override
  Future<bool> delete(FormModel form) async {
    return await _dataService.delete(modelName, form.id ?? 0);
  }

  @override
  Future<bool> update(FormModel form) async {
    return await _dataService.update(modelName, form.id!, form.toMap());
  }

  @override
  Future<List<FormModel>> getAll() async {
    var formsAsMaps = await _dataService.getAll(modelName);
    return formsAsMaps.map((e) => FormModel.fromMap(e)).toList();
  }

  @override
  Future<FormModel> getOne(int id) async {
    var formAsMap = await _dataService.find(modelName, id);
    return FormModel.fromMap(formAsMap);
  }
}
