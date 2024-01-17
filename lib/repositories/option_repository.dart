import 'package:cocoforms/interfaces/data_provider.dart';
import 'package:cocoforms/models/option_model.dart';
import 'package:cocoforms/enums/models.dart';

class OptionRepository {
  OptionRepository(this.dataProvider);
  DataProvider dataProvider;

  Future<List<OptionModel>> getOptions() async {
    var data = await dataProvider.getAll(Models.option);
    var forms = data.map((e) => OptionModel.fromMap(e)).toList();
    return forms;
  }

  Future<List<OptionModel>> getOptionsByQuestionId(questionId) async {
    var data = await dataProvider.getAll(Models.option);
    var forms = data
        .map((e) => OptionModel.fromMap(e))
        .where((e) => e.questionId == questionId)
        .toList();
    return forms;
  }

  Future<OptionModel> getOption(int id) async {
    var data = await dataProvider.get(Models.option, id);
    var form = OptionModel.fromMap(data);
    return form;
  }
}
