class OptionModel {
  final int id;
  final String value;
  final int questionId;

  OptionModel({
    required this.id,
    required this.value,
    required this.questionId,
  });

  factory OptionModel.fromMap(Map<String, dynamic> json) {
    return OptionModel(
      questionId: json['questionId'],
      value: json['value'],
      id: json['id'],
    );
  }
}
