import 'package:cocoforms/features/form/data/models/question_model.dart';
import 'package:cocoforms/features/form/views/widgets/option_card.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.question});

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  question.expression,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              Column(
                children: question.options
                    .map(
                      (option) => OptionCard(
                        option: option,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
