import 'package:cocoforms/features/form/data/models/question_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class AnswerModel {
  @Id()
  int id;

  String value;

  final question = ToOne<QuestionModel>();

  AnswerModel({
    required this.id,
    required this.value,
  });
}
