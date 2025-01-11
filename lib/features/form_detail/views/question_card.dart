import 'package:cocoforms/features/form_edit/data/models/option_model.dart';
import 'package:cocoforms/features/form_edit/data/models/question_model.dart';
import 'package:cocoforms/features/form_edit/providers/question_provider.dart';
import 'package:cocoforms/features/form_edit/views/widgets/editable_option.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditableQuestion extends StatelessWidget {
  const EditableQuestion({super.key, required this.question});

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
              Text(question.expression),
              Column(
                children: question.options
                    .map(
                      (optionVM) => EditableOption(
                        optionVM: optionVM,
                      ),
                    )
                    .toList(),
              ),
              TextButton(
                onPressed: () {
                  var option = OptionModel(
                    id: 0,
                    value: 'Seçenek',
                  );

                  var questionProvider = Provider.of<QuestionChangeNotifier>(
                    context,
                    listen: false,
                  );

                  questionProvider.addQuestion(question, option);
                },
                child: const Text('Seçenek ekle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
