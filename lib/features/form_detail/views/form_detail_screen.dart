import 'package:cocoforms/features/form_detail/data/models/question_model.dart';
import 'package:cocoforms/features/form_detail/views/widgets/editable_question.dart';
import 'package:cocoforms/features/form_list/data/models/form_model.dart';
import 'package:flutter/material.dart';

class FormDetailScreen extends StatefulWidget {
  const FormDetailScreen({
    super.key,
    required this.form,
  });

  final FormModel form;

  @override
  State<FormDetailScreen> createState() => _FormEditPageState();
}

class _FormEditPageState extends State<FormDetailScreen> {
  List<QuestionModel> controllers = [];

  Future<List<QuestionModel>> getQuestionsByFormId(int id) async {
    //var formRepository = Provider.of<FormRepository>(context, listen: false);
    //var data = await formRepository.getOne(id);

    // TODO: get questions from form
    controllers = List.generate(10, (index) {
      return QuestionModel(
        expression: 'random',
        formId: id,
        id: index,
      );
    });
    return controllers;
  }

  // TODO: implement save
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
        future: getQuestionsByFormId(widget.form.id ?? 1),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var questions = snapshot.data as List<QuestionModel>;
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
