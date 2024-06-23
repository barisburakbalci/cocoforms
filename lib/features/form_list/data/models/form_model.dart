import 'package:cocoforms/core/classes/formatted_date.dart';
import 'package:cocoforms/features/folder_detail/data/models/folder_model.dart';
import 'package:cocoforms/features/form_edit/data/models/question_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class FormModel {
  @Id()
  int id = 0;

  String name;

  FormattedDate createdDate = FormattedDate(DateTime.now());
  FormattedDate? modifiedDate;

  FormModel({required this.name});

  final folder = ToOne<FolderModel>();

  @Backlink('form')
  final questions = ToMany<QuestionModel>();
}
