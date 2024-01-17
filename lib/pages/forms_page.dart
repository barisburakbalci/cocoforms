import 'package:flutter/material.dart';
import 'package:cocoforms/widgets/form_list.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formlar'),
        centerTitle: false,
      ),
      body: const FormList(),
    );
  }
}
