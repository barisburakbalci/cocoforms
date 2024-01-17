import 'package:cocoforms/models/form_model.dart';
import 'package:cocoforms/pages/form_edit_page.dart';
import 'package:cocoforms/widgets/question_list.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({
    super.key,
    required this.form,
  });

  final FormModel form;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.form.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_square),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormEditPage(form: widget.form),
                ),
              ),
            },
          ),
        ],
      ),
      body: QuestionList(formId: widget.form.id),
    );
  }
}
