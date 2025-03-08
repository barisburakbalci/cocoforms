import 'package:cocoforms/features/form/data/models/question_model.dart';
import 'package:cocoforms/features/form/providers/option_provider.dart';
import 'package:cocoforms/features/form/views/widgets/editable_question.dart';
import 'package:cocoforms/features/form/data/models/form_model.dart';
import 'package:cocoforms/features/form/providers/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormEditScreen extends StatelessWidget {
  FormEditScreen({
    super.key,
    required this.form,
  });

  final FormModel form;
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController(text: form.name);

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            var optionProvider = Provider.of<OptionChangeNotifier>(
              context,
              listen: false,
            );
            optionProvider.getAll();

            Navigator.pop(context);
          },
        ),
        title: SizedBox(
          width: 250,
          child: TextField(
            textAlign: TextAlign.center,
            controller: titleController,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              var formProvider = Provider.of<FormChangeNotifier>(
                context,
                listen: false,
              );
              form.name = titleController.text;
              formProvider.update(form);
              _formKey.currentState?.save();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${titleController.text} güncellendi.'),
                  showCloseIcon: true,
                ),
              );
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Consumer<FormChangeNotifier>(
        builder: (context, ref, child) {
          var questions = form.questions;

          return Form(
            key: _formKey,
            child: Column(
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
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          var formProvider = Provider.of<FormChangeNotifier>(
            context,
            listen: false,
          );
          var question = QuestionModel(
            id: 0,
            expression: 'Soru',
          );
          formProvider.addQuestion(form, question);
        },
      ),
    );
  }
}
