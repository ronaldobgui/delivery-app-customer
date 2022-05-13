import 'package:delivery_app_customer/screens/home/home.dart';
import 'package:delivery_app_customer/screens/user/user_sign_up.dart';
import 'package:flutter/material.dart';

class UserSignInEmail extends StatefulWidget {
  static const String routeName = '/user-sign-in-email';

  const UserSignInEmail({Key? key}) : super(key: key);

  @override
  State<UserSignInEmail> createState() => _UserSignInEmailState();
}

class _UserSignInEmailState extends State<UserSignInEmail> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entre com Email'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Image(
                image: AssetImage('./assets/images/icon.png'),
                width: 100,
                height: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Delivery para Clientes',
                style: TextStyle(
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Senha',
                ),
                obscureText: true,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                child: const Text('Entrar'),
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Home.routeName,
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton(
                child: const Text('Crie uma conta'),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    UserSignUp.routeName,
                  );
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}
