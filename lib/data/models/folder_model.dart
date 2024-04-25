import 'package:cocoforms/data/models/form_model.dart';

class FolderModel {
  int? id;
  final String name;
  final List<FormModel> forms;

  FolderModel({
    required this.name,
    required this.forms,
  });

  factory FolderModel.fromMap(Map<String, dynamic> map) {
    return FolderModel(
      name: map['name'],
      forms: List<FormModel>.empty(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
