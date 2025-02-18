import 'package:cocoforms/features/form/data/models/question_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class OptionModel {
  @Id()
  int id;

  String value;

  bool isChecked = false;

  final question = ToOne<QuestionModel>();

  OptionModel({
    required this.id,
    required this.value,
  });
}
