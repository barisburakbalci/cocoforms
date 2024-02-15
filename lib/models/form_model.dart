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

  factory FormModel.fromMap(Map<String, dynamic> map) {
    List<QuestionModel> questions = [];
    if (map['questions'] != null) {
      var questionMaps = map['questions'] as List<dynamic>;
      questions = questionMaps.map((e) => QuestionModel.fromMap(e)).toList();
    }

    return FormModel(
      name: map['name'],
      id: map['id'],
      questions: questions,
    );
  }
}
