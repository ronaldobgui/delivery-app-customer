import 'package:delivery_app_customer/dto/inteface/entity_base.dart';
import 'package:delivery_app_customer/dto/usuario.dart';

class Cliente extends EntityBase {
  String nome;
  String cpf;
  String dataNascimento;
  Usuario usuario;

  Cliente({
    int? id,
    required this.nome,
    required this.cpf,
    required this.dataNascimento,
    required this.usuario,
  }) : super(id: id);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'telefone': cpf,
      'dataNascimento': dataNascimento,
      'usuario': usuario.toMap(),
    };
  }

  Cliente.fromMap(Map<String, dynamic> map)
      : nome = map['nome'],
        cpf = map['telefone'],
        dataNascimento = map['dataNascimento'],
        usuario = Usuario.fromMap(map['usuario']),
        super(id: map['id']);
}
