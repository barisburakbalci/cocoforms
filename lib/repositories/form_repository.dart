import 'package:cocoforms/interfaces/data_provider.dart';
import 'package:cocoforms/models/form_model.dart';
import 'package:cocoforms/enums/models.dart';

class FormRepository {
  FormRepository(this.dataProvider);
  DataProvider dataProvider;

  Future<List<FormModel>> getForms() async {
    var data = await dataProvider.getAll(Models.form);
    var forms = data.map((e) => FormModel.fromMap(e)).toList();
    return forms;
  }

  Future<FormModel> getForm(int id) async {
    var data = await dataProvider.get(Models.form, id);
    var form = FormModel.fromMap(data);
    return form;
  }

  Future<FormModel> getFormWithQuestions(int id) async {
    var data = await dataProvider.get(Models.form, id, isDetailed: true);
    var form = FormModel.fromMap(data);
    return form;
  }
}
