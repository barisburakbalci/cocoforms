import 'package:cocoforms/models/option_model.dart';
import 'package:flutter/material.dart';

class EditableOptionVM {
  final OptionModel option;
  final TextEditingController optionController;

  EditableOptionVM({required this.option})
      : optionController = TextEditingController(text: option.value);
}
