import 'package:cocoforms/features/form_detail/views/form_detail_screen.dart';
import 'package:cocoforms/features/form_list/data/models/form_model.dart';
import 'package:cocoforms/features/form_list/views/widgets/action_button.dart';
import 'package:flutter/material.dart';

class FormActionButtons extends StatelessWidget {
  const FormActionButtons({
    super.key,
    required this.form,
  });

  final FormModel form;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ActionButton(
          icon: Icons.edit,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormDetailScreen(
                  form: form,
                ),
              ),
            );
          },
        ),
        ActionButton(
          icon: Icons.copy,
          onPressed: () {},
        ),
        ActionButton(
          icon: Icons.delete,
          onPressed: () {},
        ),
      ],
    );
  }
}
