import 'dart:convert';
import 'dart:io';
import 'package:delivery_app_customer/repository/interface/repository.dart';
import 'package:delivery_app_customer/repository/settings.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app_customer/dto/usuario.dart';

class AuthenticationService {
  final String _path = '${Settings.path}/usuarios';

  static Usuario? _usuario;

  final IRepository<Usuario> _usuarioRepository;

  AuthenticationService(this._usuarioRepository);

  static Usuario? get currentUser {
    return _usuario;
  }

  static String? get currentToken {
    return _usuario?.token;
  }

  Future<Usuario> signIn(Usuario dto) async {
    final p = await http.post(
      Uri.parse('$_path/login'),
      body: jsonEncode(dto.toMap()),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      },
    );
    return _usuario = Usuario.fromMap(jsonDecode(p.body));
  }

  Future<Usuario> signUp(Usuario dto) async {
    await _usuarioRepository.add(dto);
    return await signIn(dto);
  }
}
