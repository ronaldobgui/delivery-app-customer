import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/cliente_repository.dart';
import 'package:delivery_app_customer/screens/perfil/endereco.dart';
import 'package:delivery_app_customer/screens/perfil/list_item.dart';
import 'package:delivery_app_customer/screens/perfil/meus_dados.dart';
import 'package:delivery_app_customer/screens/perfil/pagamento.dart';
import 'package:delivery_app_customer/screens/user/user_sign_in.dart';
import 'package:delivery_app_customer/service/authentication_service.dart';
import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  final List<ListItem> _list = [
    ListItem(
      title: 'Meus Dados',
      subTitle: 'Dados da minha conta',
      icon: Icons.description,
      event: (context) async {
        final Usuario? usuario = AuthenticationService.currentUser;
        if(usuario == null) {
          throw Exception('Usuário não está logado');
        }
        final clienteRepository = ClienteFirebaseRepository();
        Cliente? cliente = await clienteRepository.getByUsuarioId(usuario.id!);
        if(cliente == null) {
          throw Exception('Cliente não encontrado');
        }
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return MeusDados(usuario: usuario, cliente: cliente);
          }),
        );
      },
    ),
    ListItem(
      title: 'Pagamentos',
      subTitle: 'Meus pagamentos e cartões',
      icon: Icons.payment,
      event: (context) {
        Navigator.of(context).pushNamed(Pagamento.routeName);
      },
    ),
    ListItem(
      title: 'Endereços',
      subTitle: 'Meus endereços para entrega',
      icon: Icons.location_pin,
      event: (context) {
        Navigator.of(context).pushNamed(Endereco.routeName);
      },
    ),
    ListItem(
      title: 'Sair',
      subTitle: 'Sair do aplicativo',
      icon: Icons.logout,
      event: (context) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          UserSignIn.routeName,
          (route) => false,
        );
      },
    ),
  ];

  late Usuario? _usuario;

  @override
  void initState() {
    super.initState();
    _usuario = AuthenticationService.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('./assets/images/user.png'),
              radius: 20,
              backgroundColor: Colors.grey,
            ),
            const SizedBox(
              width: 20,
            ),
            Text('${_usuario?.nome}', overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            var item = _list[index];
            return GestureDetector(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0,
                        child: Icon(item.icon),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              item.subTitle,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      const Expanded(
                        flex: 0,
                        child: Icon(
                          Icons.arrow_forward,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                item.event(context);
              },
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              height: 1,
              color: Colors.black26,
            );
          },
          itemCount: _list.length,
        ),
      ),
    );
  }
}
