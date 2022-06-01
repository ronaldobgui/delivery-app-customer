import 'package:delivery_app_customer/dto/inteface/entity_base.dart';

abstract class IRepository<T extends EntityBase> {
  Future<void> add(T dto);
  Future<List<T>> all();
  Future<void> delete(T dto);
  Future<T?> get(String id);
  Future<void> update(T dto);
}
