import 'package:cocoforms/features/form/data/models/option_model.dart';
import 'package:cocoforms/features/form/data/models/question_model.dart';
import 'package:cocoforms/features/form/providers/option_provider.dart';
import 'package:cocoforms/features/form/providers/question_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.option,
    required this.question,
  });

  final OptionModel option;
  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    //final questions = Provider.of<QuestionChangeNotifier>(context);
    //final options = Provider.of<OptionChangeNotifier>(context);

    return Consumer2<OptionChangeNotifier, QuestionChangeNotifier>(
        builder: (context, options, questions, child) {
      return ListTile(
        dense: true,
        leading: !question.hasMultipleAnswers
            ? Radio(
                value: option.id,
                groupValue: question.selectedOptionId,
                onChanged: (value) {
                  question.selectedOptionId = option.id;
                  questions.update(question);
                },
              )
            : Checkbox(
                value: option.isChecked,
                onChanged: (value) {
                  option.isChecked = value!;
                  options.update(option);
                }),
        title: Text(option.value),
      );
    });
  }
}
