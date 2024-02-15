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

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    List<FormModel> forms = [];
    if (map['forms'] != null) {
      var formMaps = map['forms'] as List<dynamic>;
      forms = formMaps.map((e) => FormModel.fromMap(e)).toList();
    }

    return CustomerModel(
      name: map['name'],
      id: map['id'],
      forms: forms,
    );
  }
}
