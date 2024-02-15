import 'package:cocoforms/vm/editable_option_vm.dart';
import 'package:flutter/material.dart';

class EditableOption extends StatefulWidget {
  const EditableOption({super.key, required this.optionVM});

  final EditableOptionVM optionVM;

  @override
  State<EditableOption> createState() => _EditableOptionState();
}

class _EditableOptionState extends State<EditableOption> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: const Icon(
        Icons.check_box_outline_blank,
        size: 20.0,
      ),
      title: TextField(
        style: const TextStyle(
          fontSize: 15.0,
        ),
        controller: widget.optionVM.optionController,
      ),
    );
  }
}
