import 'package:cocoforms/features/form_edit/data/models/option_model.dart';
import 'package:cocoforms/features/form_edit/data/models/question_model.dart';
import 'package:cocoforms/features/form_edit/views/widgets/editable_option.dart';
import 'package:flutter/material.dart';

class EditableQuestion extends StatelessWidget {
  const EditableQuestion({super.key, required this.questionVM});

  final QuestionModel questionVM;

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
              TextField(
                controller: TextEditingController(
                  text: questionVM.expression,
                ),
              ),
              Column(
                children: questionVM.options
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
