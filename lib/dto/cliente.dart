import 'package:delivery_app_customer/dto/inteface/i_entity.dart';

class Cliente extends IEntity {
  @override
  int? id;
  String cpf;
  DateTime? dataNascimento;
  int? usuarioId;

  Cliente({
    this.id,
    this.cpf = '',
    this.dataNascimento,
    this.usuarioId = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    final map = {
      'id': id?.toInt(),
      'cpf': cpf,
      'dataNascimento': dataNascimento?.toIso8601String(),
      'usuarioId': usuarioId,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  Cliente.fromMap(Map<String, dynamic> map)
      : id = map['id']?.toInt(),
        cpf = map['cpf'],
        dataNascimento = DateTime.parse(map['dataNascimento']),
        usuarioId = map['usuarioId'];
}
