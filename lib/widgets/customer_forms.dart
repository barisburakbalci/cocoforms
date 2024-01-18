import 'package:cocoforms/models/form_model.dart';
import 'package:cocoforms/pages/review_answers_page.dart';
import 'package:cocoforms/providers/remote_data_provider.dart';
import 'package:cocoforms/repositories/customer_repository.dart';
import 'package:flutter/material.dart';

Future<List<FormModel>> getForms(int id) async {
  var repository = CustomerRepository(RemoteDataProvider());
  var data = await repository.getFormsOfCustomer(id);
  return data;
}

class CustomerForms extends StatelessWidget {
  const CustomerForms({
    super.key,
    required this.customerId,
  });

  final int customerId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Card(
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            FutureBuilder(
              future: getForms(customerId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return const SizedBox(
                      width: 1,
                    );
                  }
                  List<FormModel> forms = snapshot.data as List<FormModel>;
                  return Column(
                    children: [
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: forms.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(forms[index].name),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ReviewAnswersPage(form: forms[index]),
                              ),
                            );
                          },
                        ),
                      ),
                      const Divider(
                        height: 1.0,
                      ),
                    ],
                  );
                } else {
                  return const SizedBox(
                    width: 1,
                  );
                }
              },
            ),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_circle_outline),
                    SizedBox(width: 10.0),
                    Text(
                      'Form Doldur',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
