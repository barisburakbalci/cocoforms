import 'package:cocoforms/models/form_model.dart';
import 'package:cocoforms/pages/form_edit_page.dart';
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
        IconButton(
          iconSize: 20.0,
          visualDensity: VisualDensity.compact,
          icon: const Icon(Icons.edit),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormEditPage(
                  form: form,
                ),
              ),
            );
          },
        ),
        IconButton(
          iconSize: 20.0,
          visualDensity: VisualDensity.compact,
          icon: const Icon(Icons.copy),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 20.0,
          visualDensity: VisualDensity.compact,
          icon: const Icon(Icons.delete),
          onPressed: () {},
        ),
      ],
    );
  }
}
