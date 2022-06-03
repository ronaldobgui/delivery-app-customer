import 'package:delivery_app_customer/dto/inteface/entity_base.dart';

class Usuario extends EntityBase {
  String nome;
  String telefone;
  String email;
  String senha;
  DateTime dataCadastro;

  Usuario({
    required int id,
    required this.nome,
    required this.telefone,
    required this.email,
    required this.senha,
    required this.dataCadastro,
  }) : super(id: id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'senha': senha,
      'dataCadastro': dataCadastro.toIso8601String(),
    };
  }

  Usuario.fromMap(Map<String, dynamic> map)
      : nome = map['nome'],
        telefone = map['telefone'],
        email = map['email'],
        senha = map['senha'],
        dataCadastro = DateTime.parse(map['dataCadastro']),
        super(id: map['id']);
}
