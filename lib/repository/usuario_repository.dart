import 'dart:convert';
import 'dart:io';
import 'package:delivery_app_customer/repository/settings.dart';
import 'package:delivery_app_customer/service/authentication_service.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/repository.dart';

class UsuarioFirebaseRepository extends IRepository<Usuario> {
  final String _path = '${Settings.path}/usuarios';

  String? get _currentToken {
    return AuthenticationService.currentToken;
  }

  @override
  Future<Usuario> add(Usuario dto) async {
    print(dto.toMap());
    await http.post(
      Uri.parse(_path),
      body: jsonEncode(dto.toMap()),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      },
    );
    return dto;
  }

  @override
  Future<List<Usuario>> all() async {
    final response = await http.get(
      Uri.parse(_path),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
    List list = jsonDecode(response.body);
    return list.map((e) => Usuario.fromMap(e)).toList();
  }

  @override
  Future<void> delete(Usuario dto) async {
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
  Future<Usuario?> get(int id) async {
    final response = await http.get(
      Uri.parse('$_path/$id'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $_currentToken',
      },
    );
    return Usuario.fromMap(jsonDecode(response.body));
  }

  @override
  Future<Usuario> update(Usuario dto) async {
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
