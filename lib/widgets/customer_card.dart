import 'package:cocoforms/models/customer_model.dart';
import 'package:cocoforms/models/form_model.dart';
import 'package:cocoforms/providers/remote_data_provider.dart';
import 'package:cocoforms/repositories/customer_repository.dart';
import 'package:flutter/material.dart';

class CustomerCard extends StatefulWidget {
  const CustomerCard({super.key, required this.customer});

  final CustomerModel customer;

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  bool isExpanded = false;

  Future<List<FormModel>> getForms(int id) async {
    var repository = CustomerRepository(RemoteDataProvider());
    var data = await repository.getFormsOfCustomer(widget.customer.id);
    return data;
  }

  void expandCustomer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          surfaceTintColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                InkWell(
                  onTap: expandCustomer,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.customer.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      IconButton(
                        onPressed: expandCustomer,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        style: ButtonStyle(
                          iconSize: MaterialStateProperty.all(30.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Card(
              child: FutureBuilder(
                future: getForms(widget.customer.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<FormModel> forms = snapshot.data as List<FormModel>;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: forms.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(forms[index].name),
                        onTap: () {},
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
      ],
    );
  }
}
