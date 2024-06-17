import 'package:cocoforms/features/form_list/data/models/form_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class FolderModel {
  @Id()
  int id = 0;

  String name;

  FolderModel({required this.name});

  @Backlink('folder')
  final forms = ToMany<FormModel>();
}
