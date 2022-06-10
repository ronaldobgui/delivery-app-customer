import 'dart:convert';
import 'dart:io';
import 'package:delivery_app_customer/dto/endereco.dart';
import 'package:delivery_app_customer/repository/settings.dart';
import 'package:delivery_app_customer/service/authentication_service.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app_customer/repository/interface/repository.dart';

class EnderecoFirebaseRepository extends IRepository<Endereco> {
  final String _path = '${Settings.path}/enderecos';

  String? get _currentToken {
    return AuthenticationService.currentToken;
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Future<Endereco> add(Endereco endereco) async {
    await http.post(
      Uri.parse(_path),
      body: jsonEncode(endereco.toMap()),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
    return endereco;
  }

  @override
  Future<List<Endereco>> all() async {
    final response = await http.get(
      Uri.parse(_path),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
    List list = jsonDecode(response.body);
    return list.map((e) => Endereco.fromMap(e)).toList();
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Future<void> delete(Endereco endereco) async {
    await http.delete(
      Uri.parse(_path),
      body: jsonEncode(endereco.toMap()),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
  }

  @override
  Future<Endereco?> get(int id) async {
    final response = await http.get(
      Uri.parse('$_path/$id'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
    return Endereco.fromMap(jsonDecode(response.body));
  }

  Future<List<Endereco>> getByUsuarioId(int usuarioId) async {
    final response = await http.get(
      Uri.parse('$_path/usuarios/$usuarioId'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
    List list = jsonDecode(response.body);
    return list.map((e) => Endereco.fromMap(e)).toList();
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Future<Endereco> update(Endereco endereco) async {
    await http.put(
      Uri.parse(_path),
      body: jsonEncode(endereco.toMap()),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
    return endereco;
  }
}
