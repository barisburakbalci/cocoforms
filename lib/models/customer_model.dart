import 'package:cocoforms/models/form_model.dart';

class CustomerModel {
  final int id;
  final String name;
  final List<FormModel> forms;

  CustomerModel({
    required this.id,
    required this.name,
    this.forms = const [],
  });

  factory CustomerModel.fromMap(Map<String, dynamic> json) {
    List<FormModel> forms = [];
    if (json['forms'] != null) {
      var formMaps = json['forms'] as List<dynamic>;
      forms = formMaps.map((e) => FormModel.fromMap(e)).toList();
    }

    return CustomerModel(
      name: json['name'],
      id: json['id'],
      forms: forms,
    );
  }
}
