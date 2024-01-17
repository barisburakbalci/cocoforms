import 'package:cocoforms/models/form_model.dart';
import 'package:cocoforms/widgets/form_action_buttons.dart';
import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  const FormCard({super.key, required this.form});

  final FormModel form;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              form.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            FormActionButtons(form: form),
          ],
        ),
      ),
    );
  }
}
