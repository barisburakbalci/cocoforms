import 'package:cocoforms/models/question_model.dart';

class FormModel {
  final String name;
  final int id;
  final List<QuestionModel> questions;

  FormModel({
    required this.id,
    required this.name,
    this.questions = const [],
  });

  factory FormModel.fromMap(Map<String, dynamic> json) {
    List<QuestionModel> questions = [];
    if (json['questions'] != null) {
      var questionMaps = json['questions'] as List<dynamic>;
      questions = questionMaps.map((e) => QuestionModel.fromMap(e)).toList();
    }

    return FormModel(
      name: json['name'],
      id: json['id'],
      questions: questions,
    );
  }
}
