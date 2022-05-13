import 'package:delivery_app_customer/screens/perfil/endereco.dart';
import 'package:delivery_app_customer/screens/perfil/list_item.dart';
import 'package:delivery_app_customer/screens/perfil/pagamento.dart';
import 'package:delivery_app_customer/screens/user/user_sign_in.dart';
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
      event: (context) {
        // Navigator.of(context).pushNamed(Pagamentos.routeName);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: AssetImage('./assets/images/user.png'),
              radius: 20,
              backgroundColor: Colors.grey,
            ),
            SizedBox(
              width: 20,
            ),
            Text('Nome do Cliente')
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
