class AnswerModel {
  final int id;
  final int questionId;
  final int optionId;

  AnswerModel({
    required this.id,
    required this.questionId,
    required this.optionId,
  });

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      questionId: map['questionId'],
      id: map['id'],
      optionId: map['optionId'],
    );
  }
}
