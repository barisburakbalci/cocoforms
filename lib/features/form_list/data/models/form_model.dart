import 'package:cocoforms/features/folder_detail/data/models/folder_model.dart';

class FormModel {
  int? id;
  final String name;
  late List<FolderModel> folders;

  FormModel({
    this.id,
    required this.name,
  });

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      id: map['id'],
      name: map['name'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
