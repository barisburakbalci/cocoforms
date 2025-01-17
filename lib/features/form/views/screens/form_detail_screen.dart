import 'package:cocoforms/features/form/data/models/form_model.dart';
import 'package:cocoforms/features/form/providers/form_provider.dart';
import 'package:cocoforms/features/form/views/widgets/question_card.dart';
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
        title: Text(form.name),
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
                    return QuestionCard(question: questions[index]);
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
