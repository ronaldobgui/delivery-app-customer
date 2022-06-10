import 'package:delivery_app_customer/dto/inteface/entity_base.dart';

abstract class IRepository<T extends EntityBase> {
  Future<T> add(T dto);
  Future<List<T>> all();
  Future<void> delete(T dto);
  Future<T?> get(int id);
  Future<T> update(T dto);
}
