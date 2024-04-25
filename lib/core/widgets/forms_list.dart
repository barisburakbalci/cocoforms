import 'package:cocoforms/providers/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormsList extends StatelessWidget {
  const FormsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FormProvider>(builder: (context, ref, child) {
      return ListView.builder(
        itemCount: ref.forms.length,
        itemBuilder: (context, index) {
          final form = ref.forms[index];
          return ListTile(
            title: Text(form.name),
          );
        },
      );
    });
  }
}
