import 'package:cocoforms/features/form/data/models/form_model.dart';
import 'package:cocoforms/features/form/providers/form_provider.dart';
import 'package:cocoforms/features/form/views/widgets/forms_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formlar'),
        centerTitle: false,
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: FormsList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          var formProvider = Provider.of<FormChangeNotifier>(
            context,
            listen: false,
          );
          var lastFormId = 1;

          if (formProvider.forms.isNotEmpty) {
            lastFormId = formProvider.forms.last.id + 1;
          }

          formProvider.add(
            FormModel(
              name: 'Dummy Form $lastFormId',
            ),
          );
        },
      ),
    );
  }
}
