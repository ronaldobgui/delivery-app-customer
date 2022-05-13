import 'package:delivery_app_customer/screens/inicio/fornecedores_list.dart';
import 'package:delivery_app_customer/screens/inicio/inicio_item.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final List<String> _categorias = ['Todos', 'Comidas', 'Bebidas'];

  final List<InicioItem> _todos = [
    InicioItem(
      title: 'CJ Lanches',
      categoria: 'Lanches',
      distancia: 5.5,
      tempoEntrega: 10,
      frete: 10,
      image: const AssetImage('./assets/images/user.png'),
      event: (context) {
        //
      },
    ),
    InicioItem(
      title: 'Faveri Carnes e Cia',
      categoria: 'Carnes',
      distancia: 7.2,
      tempoEntrega: 20,
      frete: 0,
      image: const AssetImage('./assets/images/user.png'),
      event: (context) {
        //
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fornecedores'),
          bottom: TabBar(
            tabs: _categorias.map((e) => Tab(text: e)).toList(),
          ),
        ),
        body: TabBarView(children: [
          FornecedoresList(list: _todos),
          FornecedoresList(list: _todos),
          FornecedoresList(list: _todos),
        ]),
      ),
      length: _categorias.length,
    );
  }
}
