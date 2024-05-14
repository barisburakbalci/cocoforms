class OptionModel {
  final int id;
  final String value;
  final int questionId;

  OptionModel({
    required this.id,
    required this.value,
    required this.questionId,
  });

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      questionId: map['questionId'],
      value: map['value'],
      id: map['id'],
    );
  }
}
