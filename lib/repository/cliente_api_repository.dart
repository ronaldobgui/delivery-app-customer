import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/repository/interface/repository.dart';

class ClienteFirebaseRepository extends IRepository<Cliente> {
  String path = 'https://localhost:44366/clientes';

  @override
  Future<void> add(Cliente dto) async {
    await http.post(
      Uri.parse(path),
      body: dto.toMap(),
    );
  }

  @override
  Future<List<Cliente>> all() async {
    final response = await http.get(Uri.parse(path));
    List list = jsonDecode(response.body);
    return list.map((e) => Cliente.fromMap(e)).toList();
  }

  @override
  Future<void> delete(Cliente dto) async {
    await http.delete(
      Uri.parse(path),
      body: dto.toMap(),
    );
  }

  @override
  Future<Cliente?> get(String id) async {
    final response = await http.get(Uri.parse('$path/$id'));
    return Cliente.fromMap(jsonDecode(response.body));
  }

  @override
  Future<void> update(Cliente dto) async {
    await http.put(
      Uri.parse(path),
      body: dto.toMap(),
    );
  }
}
