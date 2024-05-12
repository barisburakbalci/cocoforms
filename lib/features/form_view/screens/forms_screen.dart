import 'dart:math';

import 'package:cocoforms/features/auth/widgets/user_info.dart';
import 'package:cocoforms/features/form_view/models/form_model.dart';
import 'package:cocoforms/providers/form_provider.dart';
import 'package:cocoforms/features/form_view/widgets/forms_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const UserInfo(),
            const Expanded(
              child: FormsList(),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    var dummyForm = FormModel(
                      name: 'Form ${Random().nextInt(100)}',
                    );
                    context.read<FormChangeNotifier>().add(dummyForm);
                  },
                  child: const Text('Add Dummy Form'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
