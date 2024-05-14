import 'package:cocoforms/features/form_detail/data/models/option_model.dart';
import 'package:flutter/material.dart';

class EditableOption extends StatefulWidget {
  const EditableOption({super.key, required this.optionVM});

  final OptionModel optionVM;

  @override
  State<EditableOption> createState() => _EditableOptionState();
}

class _EditableOptionState extends State<EditableOption> {
  @override
  Widget build(BuildContext context) {
    return const ListTile(
      dense: true,
      leading: Icon(
        Icons.check_box_outline_blank,
        size: 20.0,
      ),
      title: TextField(
        style: TextStyle(
          fontSize: 15.0,
        ),
      ),
    );
  }
}
