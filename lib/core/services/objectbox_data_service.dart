import 'package:cocoforms/core/services/data_service.dart';
import 'package:cocoforms/objectbox.g.dart';

class ObjectboxDataService<T> implements DataService {
  late final Store store;
  ObjectboxDataService(this.store);

  @override
  Future<Map<String, dynamic>> find(String modelName, int id) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(String entityName) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(String modelName, Map<String, dynamic> model) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> update(
      String modelName, int id, Map<String, dynamic> model) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String modelName, int id) async {
    throw UnimplementedError();
  }
}
