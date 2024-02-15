import 'package:cocoforms/models/question_model.dart';
import 'package:cocoforms/vm/editable_option_vm.dart';
import 'package:flutter/material.dart';

class EditableQuestionVM {
  final QuestionModel question;
  final TextEditingController? expressionController;
  final List<EditableOptionVM> optionsVMs;

  EditableQuestionVM({required this.question})
      : expressionController = TextEditingController(text: question.expression),
        optionsVMs = question.options
            .map((option) => EditableOptionVM(option: option))
            .toList();
}
