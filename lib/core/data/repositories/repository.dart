abstract class Repository<T> {
  Future<T?> getOne(int id);
  Future<List<T>> getAll();

  Future<bool> insert(T model);
  Future<bool> update(T model);
  Future<bool> delete(int id);
  Future<bool> deleteAll();
}
