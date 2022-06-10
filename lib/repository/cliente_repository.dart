import 'dart:convert';
import 'dart:io';
import 'package:delivery_app_customer/repository/settings.dart';
import 'package:delivery_app_customer/service/authentication_service.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/repository/interface/repository.dart';

class ClienteFirebaseRepository extends IRepository<Cliente> {
  final String _path = '${Settings.path}/clientes';

  String? get _currentToken {
    return AuthenticationService.currentToken;
  }

  @override
  Future<Cliente> add(Cliente dto) async {
    await http.post(
      Uri.parse(_path),
      body: jsonEncode(dto.toMap()),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
    return dto;
  }

  @override
  Future<List<Cliente>> all() async {
    final response = await http.get(
      Uri.parse(_path),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
    List list = jsonDecode(response.body);
    return list.map((e) => Cliente.fromMap(e)).toList();
  }

  @override
  Future<void> delete(Cliente dto) async {
    await http.delete(
      Uri.parse(_path),
      body: jsonEncode(dto.toMap()),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
  }

  @override
  Future<Cliente?> get(int id) async {
    final response = await http.get(
      Uri.parse('$_path/$id'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
    return Cliente.fromMap(jsonDecode(response.body));
  }

  Future<Cliente?> getByUsuarioId(int usuarioId) async {
    final response = await http.get(
      Uri.parse('$_path/usuarios/$usuarioId'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
    return Cliente.fromMap(jsonDecode(response.body));
  }

  @override
  Future<Cliente> update(Cliente dto) async {
    await http.put(
      Uri.parse(_path),
      body: jsonEncode(dto.toMap()),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
    return dto;
  }
}
