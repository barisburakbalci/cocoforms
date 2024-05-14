import 'package:cocoforms/features/form_list/views/widgets/forms_list.dart';
import 'package:flutter/material.dart';

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
    );
  }
}
