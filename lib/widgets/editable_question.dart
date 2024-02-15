import 'package:cocoforms/vm/editable_question_vm.dart';
import 'package:cocoforms/widgets/editable_option.dart';
import 'package:flutter/material.dart';

class EditableQuestion extends StatefulWidget {
  const EditableQuestion({super.key, required this.questionVM});

  final EditableQuestionVM questionVM;

  @override
  State<EditableQuestion> createState() => _EditableQuestionState();
}

class _EditableQuestionState extends State<EditableQuestion> {
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
                controller: widget.questionVM.expressionController,
              ),
              Column(
                children: widget.questionVM.optionsVMs
                    .map(
                      (optionVM) => EditableOption(
                        optionVM: optionVM,
                      ),
                    )
                    .toList(),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Seçenek ekle'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
