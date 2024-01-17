import 'package:cocoforms/models/form_model.dart';
import 'package:cocoforms/models/question_model.dart';
import 'package:cocoforms/providers/remote_data_provider.dart';
import 'package:cocoforms/repositories/form_repository.dart';
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
  final List<TextField> textFields = [];
  final List<TextEditingController> controllers = [];

  Future<List<QuestionModel>> getQuestionsByFormId(int id) async {
    var formRepository = FormRepository(RemoteDataProvider());
    var data = await formRepository.getFormWithQuestions(id);
    return data.questions;
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
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(5),
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: getQuestionsByFormId(widget.form.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var questions = snapshot.data as List<QuestionModel>;
            return ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return EditableQuestion(question: questions[index]);
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
