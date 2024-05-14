import 'package:cocoforms/features/folder_detail/data/models/folder_model.dart';

class FormModel {
  int? id;
  final String name;
  late List<FolderModel> folders;

  FormModel({
    required this.name,
  });

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
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
