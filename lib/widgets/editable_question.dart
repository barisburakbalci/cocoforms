import 'package:cocoforms/models/question_model.dart';
import 'package:cocoforms/widgets/editable_option.dart';
import 'package:flutter/material.dart';

class EditableQuestion extends StatefulWidget {
  const EditableQuestion({super.key, required this.question});

  final QuestionModel question;

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
            children: [
              TextField(
                controller: TextEditingController(
                  text: widget.question.expression,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  children: widget.question.options
                      .map(
                        (option) => EditableOption(
                          option: option,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
