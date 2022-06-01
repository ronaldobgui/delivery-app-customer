import 'package:flutter/material.dart';

class Cartao extends StatefulWidget {
  static const routeName = '/cartao';

  const Cartao({Key? key}) : super(key: key);

  @override
  State<Cartao> createState() => _CartaoState();
}

class _CartaoState extends State<Cartao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartões'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                title: Text('Selecione o tipo do Cartão'),
              );
            },
          );
          // Navigator.of(context).pushNamed(CartaoAdd.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
