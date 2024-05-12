abstract class DataService {
  Future<Map<String, dynamic>> find(String modelName, int id);
  Future<List<Map<String, dynamic>>> getAll(String entityName);
  Future<bool> insert(String modelName, Map<String, dynamic> model);
  Future<bool> update(String modelName, int id, Map<String, dynamic> model);
  Future<bool> delete(String modelName, int id);
}
