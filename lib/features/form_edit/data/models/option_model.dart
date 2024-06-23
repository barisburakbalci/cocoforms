import 'package:cocoforms/features/form_edit/data/models/question_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class OptionModel {
  @Id()
  int id;

  String value;

  final question = ToOne<QuestionModel>();

  OptionModel({
    required this.id,
    required this.value,
  });
}
