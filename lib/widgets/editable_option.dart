import 'package:cocoforms/models/option_model.dart';
import 'package:flutter/material.dart';

class EditableOption extends StatefulWidget {
  const EditableOption({super.key, required this.option});

  final OptionModel option;

  @override
  State<EditableOption> createState() => _EditableOptionState();
}

class _EditableOptionState extends State<EditableOption> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        fontSize: 15.0,
      ),
      decoration: const InputDecoration(
        isDense: true,
      ),
      controller: TextEditingController(
        text: widget.option.value,
      ),
    );
  }
}
