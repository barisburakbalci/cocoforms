import 'package:cocoforms/features/form_edit/views/form_detail_screen.dart';
import 'package:cocoforms/features/form_list/data/models/form_model.dart';
import 'package:cocoforms/features/form_list/views/widgets/action_buttons.dart';
import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  const FormCard({super.key, required this.form});

  final FormModel form;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 15,
        ),
        child: ListTile(
          title: Text(
            form.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          subtitle: Text(
            '${form.modifiedDate ?? form.createdDate}',
          ),
          trailing: FormActionButtons(form: form),
          onTap: () {
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
      ),
    );
  }
}
