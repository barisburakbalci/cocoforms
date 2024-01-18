class AnswerModel {
  final int id;
  final int questionId;
  final int optionId;

  AnswerModel({
    required this.id,
    required this.questionId,
    required this.optionId,
  });

  factory AnswerModel.fromMap(Map<String, dynamic> json) {
    return AnswerModel(
      questionId: json['questionId'],
      id: json['id'],
      optionId: json['optionId'],
    );
  }
}
