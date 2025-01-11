import 'package:cocoforms/features/form_edit/views/widgets/editable_question.dart';
import 'package:cocoforms/features/form_list/data/models/form_model.dart';
import 'package:cocoforms/features/form_list/providers/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormDetailScreen extends StatelessWidget {
  const FormDetailScreen({
    super.key,
    required this.form,
  });

  final FormModel form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 250,
          child: Text(form.name),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Consumer<FormChangeNotifier>(
        builder: (context, ref, child) {
          var questions = form.questions;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return EditableQuestion(question: questions[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
