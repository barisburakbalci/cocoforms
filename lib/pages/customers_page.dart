import 'package:cocoforms/models/customer_model.dart';
import 'package:cocoforms/providers/remote_data_provider.dart';
import 'package:cocoforms/repositories/customer_repository.dart';
import 'package:cocoforms/widgets/customer_card.dart';
import 'package:flutter/material.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  State<CustomersPage> createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  Future<List<CustomerModel>> getCustomers() async {
    var repository = CustomerRepository(RemoteDataProvider());
    var data = await repository.getCustomers();
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Müşteriler'),
      ),
      body: FutureBuilder(
        future: getCustomers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var customers = snapshot.data;
            return ListView.builder(
              itemCount: customers!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomerCard(customer: customers[index]),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
