import 'package:cocoforms/features/folder_detail/data/models/folder_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class FormModel {
  @Id()
  int id = 0;

  String name;

  FormModel({required this.name});

  final folder = ToOne<FolderModel>();
}
