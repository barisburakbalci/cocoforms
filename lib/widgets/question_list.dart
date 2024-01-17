import 'package:cocoforms/models/form_model.dart';
import 'package:cocoforms/providers/remote_data_provider.dart';
import 'package:cocoforms/repositories/form_repository.dart';
import 'package:cocoforms/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:cocoforms/models/question_model.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({
    super.key,
    required this.formId,
  });

  Future<FormModel> getFormWithQuestions() async {
    var formRepository = FormRepository(RemoteDataProvider());
    var data = await formRepository.getFormWithQuestions(formId);
    return data;
  }

  final int formId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getFormWithQuestions(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<QuestionModel> questions = snapshot.data!.questions;
          return ListView.builder(
            itemCount: questions.length,
            itemBuilder: (context, index) {
              QuestionModel question = questions[index];
              return QuestionCard(
                expression: question.expression,
                options: question.options,
              );
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
