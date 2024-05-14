import 'package:cocoforms/features/form_detail/data/models/option_model.dart';

class QuestionModel {
  final String expression;
  final int formId;
  final int id;
  final List<OptionModel> options;
  //final List<AnswerModel> answers;

  QuestionModel({
    required this.expression,
    required this.formId,
    required this.id,
    this.options = const [],
    //this.answers = const [],
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    List<OptionModel> options = [];
    if (map['options'] != null) {
      var optionMaps = map['options'] as List<dynamic>;
      options = optionMaps.map((e) => OptionModel.fromMap(e)).toList();
    }

    /*List<AnswerModel> answers = [];
    if (map['answers'] != null) {
      var answerMaps = map['answers'] as List<dynamic>;
      answers = answerMaps.map((e) => AnswerModel.fromMap(e)).toList();
    }*/

    return QuestionModel(
      expression: map['expression'],
      formId: map['formId'],
      id: map['id'],
      options: options,
      //answers: answers,
    );
  }
}
