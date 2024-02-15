import 'package:cocoforms/models/form_model.dart';
import 'package:cocoforms/providers/remote_data_provider.dart';
import 'package:cocoforms/repositories/form_repository.dart';
import 'package:cocoforms/vm/editable_question_vm.dart';
import 'package:cocoforms/widgets/editable_question.dart';
import 'package:flutter/material.dart';

class FormEditPage extends StatefulWidget {
  const FormEditPage({
    super.key,
    required this.form,
  });

  final FormModel form;

  @override
  State<FormEditPage> createState() => _FormEditPageState();
}

class _FormEditPageState extends State<FormEditPage> {
  List<EditableQuestionVM> controllers = [];

  Future<List<EditableQuestionVM>> getQuestionsByFormId(int id) async {
    var formRepository = FormRepository(RemoteDataProvider());
    var data = await formRepository.getFormWithQuestions(id);
    var questions = data.questions;
    controllers = List.generate(questions.length, (index) {
      return EditableQuestionVM(question: questions[index]);
    });
    return controllers;
  }

  Future<List<Map<String, String>>> saveForm() async {
    return [];
  }

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController(text: widget.form.name);
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          width: 250,
          child: TextField(
            textAlign: TextAlign.center,
            controller: titleController,
          ),
        ),
        actions: [
          IconButton(
            onPressed: saveForm,
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: FutureBuilder(
        future: getQuestionsByFormId(widget.form.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var questions = snapshot.data as List<EditableQuestionVM>;
            return ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return EditableQuestion(questionVM: questions[index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
