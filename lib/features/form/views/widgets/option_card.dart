import 'package:cocoforms/features/form/data/models/option_model.dart';
import 'package:flutter/material.dart';

class OptionCard extends StatefulWidget {
  const OptionCard({super.key, required this.option});

  final OptionModel option;

  @override
  State<OptionCard> createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      leading: Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
          }),
      title: Text(widget.option.value),
    );
  }
}
