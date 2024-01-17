import 'package:cocoforms/models/option_model.dart';

class QuestionModel {
  final String expression;
  final int formId;
  final int id;
  final List<OptionModel> options;

  QuestionModel({
    required this.expression,
    required this.formId,
    required this.id,
    this.options = const [],
  });

  factory QuestionModel.fromMap(Map<String, dynamic> json) {
    List<OptionModel> options = [];
    if (json['options'] != null) {
      var optionMaps = json['options'] as List<dynamic>;
      options = optionMaps.map((e) => OptionModel.fromMap(e)).toList();
    }

    return QuestionModel(
      expression: json['expression'],
      formId: json['formId'],
      id: json['id'],
      options: options,
    );
  }
}
