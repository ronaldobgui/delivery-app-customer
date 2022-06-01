import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/repository.dart';

class UsuarioFirebaseRepository extends IRepository<Usuario> {
  String path = 'https://localhost:44366/usuarios';

  @override
  Future<void> add(Usuario dto) async {
    await http.post(
      Uri.parse(path),
      body: dto.toMap(),
    );
  }

  @override
  Future<List<Usuario>> all() async {
    final response = await http.get(Uri.parse(path));
    List list = jsonDecode(response.body);
    return list.map((e) => Usuario.fromMap(e)).toList();
  }

  @override
  Future<void> delete(Usuario dto) async {
    await http.delete(
      Uri.parse(path),
      body: dto.toMap(),
    );
  }

  @override
  Future<Usuario?> get(String id) async {
    final response = await http.get(Uri.parse('$path/$id'));
    return Usuario.fromMap(jsonDecode(response.body));
  }

  @override
  Future<void> update(Usuario dto) async {
    await http.put(
      Uri.parse(path),
      body: dto.toMap(),
    );
  }
}
