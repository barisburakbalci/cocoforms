import 'package:cocoforms/features/form/data/models/option_model.dart';
import 'package:cocoforms/features/form/data/models/question_model.dart';
import 'package:cocoforms/features/form/providers/option_provider.dart';
import 'package:cocoforms/features/form/providers/question_provider.dart';
import 'package:cocoforms/features/form/views/widgets/editable_option.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditableQuestion extends StatelessWidget {
  const EditableQuestion({super.key, required this.question});

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionChangeNotifier>(
      builder: (context, questionProvider, child) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Çoklu seçim:', style: TextStyle(fontSize: 16)),
                    FormField(
                      initialValue: false,
                      builder: (state) {
                        return Switch(
                          value: question.hasMultipleAnswers,
                          onChanged: (value) {
                            state.didChange(value);
                            question.hasMultipleAnswers = value;
                            questionProvider.update(question);
                          },
                        );
                      },
                      onSaved: (value) {
                        question.hasMultipleAnswers = value ?? false;
                        questionProvider.update(question);
                      },
                    ),
                  ],
                ),
                TextFormField(
                  initialValue: question.expression,
                  onSaved: (value) {
                    question.expression = value ?? question.expression;
                    questionProvider.update(question);
                  },
                ),
                Consumer<OptionChangeNotifier>(builder: (_, ref, child) {
                  final options = ref.getByQuestionId(question.id);
                  return Column(children: [
                    ...options
                        .map(
                          (option) => EditableOption(
                            option: option,
                            question: question,
                          ),
                        )
                        .toList(),
                    TextButton(
                      onPressed: () {
                        var option = OptionModel(
                          id: 0,
                          value: 'Seçenek ${options.length + 1}',
                        );

                        option.question.target = question;
                        option.isTemporary = true;

                        var optionProvider = Provider.of<OptionChangeNotifier>(
                          context,
                          listen: false,
                        );

                        optionProvider.add(option);
                      },
                      child: const Text('Seçenek ekle'),
                    ),
                  ]);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
