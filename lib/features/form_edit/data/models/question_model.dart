import 'package:cocoforms/features/form_edit/data/models/option_model.dart';
import 'package:cocoforms/features/form_list/data/models/form_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class QuestionModel {
  @Id()
  int id;

  String expression;

  @Backlink('question')
  final options = ToMany<OptionModel>();

  //@Backlink('question')
  //final List<AnswerModel> answers;

  final form = ToOne<FormModel>();

  QuestionModel({
    required this.expression,
    required this.id,
    //this.answers = const [],
  });
}
