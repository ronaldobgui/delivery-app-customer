import 'package:flutter/material.dart';

class CartaoAdd extends StatefulWidget {
  static const routeName = '/card-add';

  final String tipo;

  const CartaoAdd({Key? key, required this.tipo}) : super(key: key);

  @override
  State<CartaoAdd> createState() => _CartaoAddState();
}

class _CartaoAddState extends State<CartaoAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Cartão (${widget.tipo})'),
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Apelido',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
