import 'package:delivery_app_customer/dto/inteface/entity_base.dart';

class Usuario extends EntityBase {
  @override
  int? id;
  String nome;
  String telefone;
  String email;
  String? senha;
  DateTime? dataCadastro;
  String? token;

  Usuario({
    this.id,
    this.nome = '',
    this.telefone = '',
    this.email = '',
    this.senha = '',
    this.dataCadastro,
    this.token,
  });

  @override
  Map<String, dynamic> toMap() {
    final map = {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'senha': senha,
      'dataCadastro': dataCadastro?.toIso8601String(),
      'token': token,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  Usuario.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        nome = map['nome'],
        telefone = map['telefone'],
        email = map['email'],
        dataCadastro = DateTime.parse(map['dataCadastro']),
        token = map['token'];
}
