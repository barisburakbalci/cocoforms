import 'package:cocoforms/features/form/providers/form_provider.dart';
import 'package:cocoforms/features/form/views/widgets/form_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormsList extends StatelessWidget {
  const FormsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FormChangeNotifier>(builder: (context, ref, child) {
      var forms = ref.forms.reversed.toList();
      if (forms.isEmpty) {
        return const Center(
          child: Text('Henüz kayıtlı formunuz yok'),
        );
      }
      return ListView.builder(
        itemCount: forms.length,
        itemBuilder: (context, index) {
          final form = forms[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: FormCard(form: form),
          );
        },
      );
    });
  }
}
