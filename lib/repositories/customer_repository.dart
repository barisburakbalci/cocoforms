import 'package:cocoforms/interfaces/data_provider.dart';
import 'package:cocoforms/models/customer_model.dart';
import 'package:cocoforms/enums/models.dart';
import 'package:cocoforms/models/form_model.dart';

class CustomerRepository {
  CustomerRepository(this.dataProvider);
  final DataProvider dataProvider;

  Future<List<CustomerModel>> getCustomers() async {
    var data = await dataProvider.getAll(Models.customer);
    var customers = data.map((e) => CustomerModel.fromMap(e)).toList();
    return customers;
  }

  Future<CustomerModel> getCustomer(int id) async {
    var data = await dataProvider.get(Models.customer, id);
    var customer = CustomerModel.fromMap(data);
    return customer;
  }

  Future<List<FormModel>> getFormsOfCustomer(int id) async {
    var data =
        await dataProvider.getMany(Models.customer, id, isDetailed: true);
    var forms = data.map((e) => FormModel.fromMap(e)).toList();
    return forms;
  }
}
