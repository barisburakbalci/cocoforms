import 'package:cocoforms/features/form/views/screens/form_edit_screen.dart';
import 'package:cocoforms/features/form/data/models/form_model.dart';
import 'package:cocoforms/features/form/providers/form_provider.dart';
import 'package:cocoforms/features/form/views/widgets/action_button.dart';
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
          icon: const Icon(Icons.edit_square, color: Colors.blue),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormEditScreen(
                  form: form,
                ),
              ),
            );
          },
        ),
        ActionButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => showDialog<String>(
            barrierLabel: 'Delete Form',
            context: context,
            builder: (BuildContext context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 30.0,
                ),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Are you sure you want to delete this form?'),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Provider.of<FormChangeNotifier>(
                                context,
                                listen: false,
                              ).delete(form);
                              Navigator.pop(context);
                            },
                            child: const Text('Delete'),
                          ),
                          const SizedBox(width: 15),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
