import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade400,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: const [
                    Image(
                      image: AssetImage('./assets/images/icon.png'),
                      width: 100,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Delivery para Clientes',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  // mainAxisSize: MainAxisSize.min,
                ),
              ),
              Column(
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.phone_android,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Entrar com Telefone',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: const Size(225, 45),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Entrar com E-mail',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      fixedSize: const Size(225, 45),
                    ),
                    onPressed: () {},
                  ),
                ],
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
          ),
        ),
      ),
    );
  }
}
