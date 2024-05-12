abstract class Repository<T> {
  final String modelName;
  Repository({required this.modelName});

  Future<T> getOne(int id);
  Future<List<T>> getAll();

  Future<bool> insert(T model);
  Future<bool> update(T model);
  Future<bool> delete(T model);
}
