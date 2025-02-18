import 'package:cocoforms/features/form/data/models/option_model.dart';
import 'package:cocoforms/features/form/data/models/question_model.dart';
import 'package:cocoforms/features/form/providers/option_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditableOption extends StatelessWidget {
  const EditableOption({
    super.key,
    required this.option,
    required this.question,
  });

  final OptionModel option;
  final QuestionModel question;

  @override
  Widget build(BuildContext context) {
    var valueController = TextEditingController(text: option.value);
    var optionProvider = Provider.of<OptionChangeNotifier>(
      context,
      listen: false,
    );

    return ListTile(
      dense: true,
      leading: question.hasMultipleAnswers
          ? const Icon(
              Icons.check_box_outline_blank,
              size: 20.0,
            )
          : const Icon(
              Icons.radio_button_unchecked,
              size: 20.0,
            ),
      title: TextField(
        controller: valueController,
        onChanged: (value) async {
          option.value = value;
          optionProvider.update(option);
        },
        style: const TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }
}
