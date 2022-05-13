import 'package:delivery_app_customer/screens/perfil/endereco_add.dart';
import 'package:flutter/material.dart';

class Endereco extends StatefulWidget {
  static const routeName = '/endereco';

  const Endereco({Key? key}) : super(key: key);

  @override
  State<Endereco> createState() => _EnderecoState();
}

class _EnderecoState extends State<Endereco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Endereços'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(EnderecoAdd.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
