
import 'package:delivery_app_customer/dto/inteface/dto_base.dart';

abstract class EntityBase extends DtoBase {
  int id = 0;
  EntityBase({required this.id});
}
