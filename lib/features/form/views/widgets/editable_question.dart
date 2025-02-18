import 'package:cocoforms/features/form/data/models/option_model.dart';
import 'package:cocoforms/features/form/data/models/question_model.dart';
import 'package:cocoforms/features/form/providers/question_provider.dart';
import 'package:cocoforms/features/form/views/widgets/editable_option.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditableQuestion extends StatelessWidget {
  const EditableQuestion({super.key, required this.question});

  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    var expressionController = TextEditingController(text: question.expression);
    var questionProvider = Provider.of<QuestionChangeNotifier>(
      context,
      listen: false,
    );

    return Consumer<QuestionChangeNotifier>(
      builder: (context, ref, child) => Padding(
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
                    Switch(
                        value: question.hasMultipleAnswers,
                        onChanged: (value) {
                          question.hasMultipleAnswers = value;
                          questionProvider.update(question);
                        }),
                  ],
                ),
                TextField(
                  controller: expressionController,
                  onChanged: (value) {
                    question.expression = value;
                    questionProvider.update(question);
                  },
                ),
                Consumer<QuestionChangeNotifier>(
                  builder: (_, ref, child) => Column(
                    children: question.options
                        .map(
                          (option) => EditableOption(
                            option: option,
                            question: question,
                          ),
                        )
                        .toList(),
                  ),
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

                    questionProvider.addOption(question, option);
                  },
                  child: const Text('Seçenek ekle'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
