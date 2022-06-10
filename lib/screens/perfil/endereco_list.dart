import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/screens/perfil/endereco_add.dart';
import 'package:delivery_app_customer/service/authentication_service.dart';
import 'package:flutter/material.dart';

class EnderecoList extends StatefulWidget {
  static const routeName = '/endereco-list';

  const EnderecoList({Key? key}) : super(key: key);

  @override
  State<EnderecoList> createState() => _EnderecoListState();
}

class _EnderecoListState extends State<EnderecoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Endereços'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Usuario? usuario = AuthenticationService.currentUser;
          if (usuario == null) {
            throw Exception('Usuário não está logado');
          }
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return EnderecoAdd(usuario: usuario);
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
