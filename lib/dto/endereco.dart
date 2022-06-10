import 'package:delivery_app_customer/dto/inteface/i_entity.dart';

class Endereco extends IEntity {
  @override
  int? id;
  String nome;
  String apelido;
  String complemento;
  String descricao;
  double latitude;
  double longitude;
  int? usuarioId;

  Endereco({
    this.id,
    this.nome = '',
    this.apelido = '',
    this.complemento = '',
    this.descricao = '',
    this.latitude = 0,
    this.longitude = 0,
    this.usuarioId = 0,
  });

  @override
  Map<String, dynamic> toMap() {
    final map = {
      'id': id?.toInt(),
      'nome': nome,
      'apelido': apelido,
      'complemento': complemento,
      'descricao': descricao,
      'latitude': latitude.toDouble(),
      'longitude': longitude.toDouble(),
      'usuarioId': usuarioId,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  Endereco.fromMap(Map<String, dynamic> map)
      : id = map['id']?.toInt(),
        nome = map['nome'],
        apelido = map['apelido'],
        complemento = map['complemento'],
        descricao = map['descricao'],
        latitude = map['latitude'].toDouble(),
        longitude = map['longitude'].toDouble(),
        usuarioId = map['usuarioId'];
}
