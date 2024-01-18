import 'package:cocoforms/models/form_model.dart';
import 'package:cocoforms/models/question_model.dart';
import 'package:cocoforms/providers/remote_data_provider.dart';
import 'package:cocoforms/repositories/form_repository.dart';
import 'package:cocoforms/widgets/question_card.dart';
import 'package:flutter/material.dart';

class ReviewAnswersPage extends StatefulWidget {
  const ReviewAnswersPage({
    super.key,
    required this.form,
  });

  final FormModel form;

  @override
  State<ReviewAnswersPage> createState() => _ReviewAnswersPageState();
}

class _ReviewAnswersPageState extends State<ReviewAnswersPage> {
  bool isEditing = false;
  bool isLoaded = false;
  List<QuestionModel> questions = [];

  Future<FormModel> getFormWithQuestions(formId) async {
    var formRepository = FormRepository(RemoteDataProvider());
    var data = await formRepository.getFormWithQuestions(formId);
    setState(() {
      questions = data.questions;
      isLoaded = true;
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getFormWithQuestions(widget.form.id);
  }

  Widget displayQuestions() {
    if (isLoaded) {
      return ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          QuestionModel question = questions[index];
          return QuestionCard(
            expression: question.expression,
            options: question.options,
            answers: question.answers,
            isEditing: isEditing,
          );
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.form.name),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isEditing = !isEditing;
              });
            },
            icon: isEditing
                ? const Icon(Icons.check)
                : const Icon(Icons.edit_square),
          ),
        ],
      ),
      body: displayQuestions(),
    );
  }
}
