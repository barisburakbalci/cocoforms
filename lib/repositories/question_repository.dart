import 'package:cocoforms/interfaces/data_provider.dart';
import 'package:cocoforms/models/question_model.dart';
import 'package:cocoforms/enums/models.dart';

class QuestionRepository {
  QuestionRepository(this.dataProvider);
  DataProvider dataProvider;

  Future<List<QuestionModel>> getQuestions() async {
    var data = await dataProvider.getAll(Models.question);
    var forms = data.map((e) => QuestionModel.fromMap(e)).toList();
    return forms;
  }

  Future<List<QuestionModel>> getQuestionsByFormId(formId) async {
    var data = await dataProvider.getAll(Models.question);
    var forms = data
        .map((e) => QuestionModel.fromMap(e))
        .where((element) => element.formId == formId)
        .toList();
    return forms;
  }

  Future<QuestionModel> getQuestion(int id) async {
    var data = await dataProvider.get(Models.form, id);
    var form = QuestionModel.fromMap(data);
    return form;
  }
}
