import 'package:cocoforms/features/form_edit/views/form_detail_screen.dart';
import 'package:cocoforms/features/form_list/data/models/form_model.dart';
import 'package:cocoforms/features/form_list/providers/form_provider.dart';
import 'package:cocoforms/features/form_list/views/widgets/action_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          onPressed: () {
            if (form.id != 0) {
              var formProvider = Provider.of<FormChangeNotifier>(
                context,
                listen: false,
              );
              formProvider.delete(form);
            }
          },
        ),
      ],
    );
  }
}
