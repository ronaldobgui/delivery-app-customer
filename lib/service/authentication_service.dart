import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:delivery_app_customer/dto/usuario.dart';

class AuthenticationService {
  final String _path = 'https://localhost:44366/usuarios';

  static Usuario? _usuario;

  AuthenticationService();

  Usuario? getCurrentUser() {
    return _usuario;
  }

  Future<void> getToken(Usuario dto) async {
    var p = await http.post(
      Uri.parse('$_path/login'),
      body: jsonEncode(dto.toMap()),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      },
    );
    _usuario = Usuario.fromMap(jsonDecode(p.body));
  }
}
