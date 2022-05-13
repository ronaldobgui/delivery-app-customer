import 'package:delivery_app_customer/screens/perfil/list_item.dart';
import 'package:flutter/material.dart';

class Pagamentos extends StatefulWidget {

  static const String routeName = '/pagamentos';

  const Pagamentos({Key? key}) : super(key: key);

  @override
  State<Pagamentos> createState() => _PagamentosState();
}

class _PagamentosState extends State<Pagamentos> {
  final List<ListItem> _list = [
    ListItem(
      title: 'Histórico',
      subTitle: 'Histórico de pagamentos',
      icon: Icons.history,
      event: (context) {
        // Navigator.of(context).pushNamed(MedicoList.routeName);
      },
    ),
    ListItem(
      title: 'Cartões',
      subTitle: 'Meus cartões',
      icon: Icons.credit_card,
      event: (context) {
        // Navigator.of(context).pushNamed(MedicoList.routeName);
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamentos'),
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
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
