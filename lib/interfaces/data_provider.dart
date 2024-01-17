import 'package:cocoforms/enums/models.dart';

abstract class DataProvider {
  Future<List<dynamic>> getAll(Models model);
  Future<dynamic> get(Models model, int id, {bool isDetailed = false});
  Future<List<dynamic>> getMany(Models model, int id,
      {bool isDetailed = false});
}
