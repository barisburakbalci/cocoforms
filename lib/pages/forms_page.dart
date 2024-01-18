import 'dart:developer';

import 'package:cocoforms/models/form_model.dart';
import 'package:cocoforms/providers/remote_data_provider.dart';
import 'package:cocoforms/repositories/form_repository.dart';
import 'package:cocoforms/widgets/form_card.dart';
import 'package:flutter/material.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

Future<List<FormModel>> getForms() async {
  var formRepository = FormRepository(RemoteDataProvider());
  var data = await formRepository.getForms();
  return data;
}

class _FormsPageState extends State<FormsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formlar'),
        centerTitle: false,
      ),
      body: FutureBuilder(
          future: getForms(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              log(snapshot.error.toString());
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              List<FormModel> forms = snapshot.data as List<FormModel>;
              return ListView.builder(
                itemCount: forms.length,
                itemBuilder: (context, index) {
                  FormModel form = forms[index];
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FormCard(form: form),
                  );
                },
              );
            }

            return const CircularProgressIndicator();
          }),
    );
  }
}
