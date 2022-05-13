import 'package:delivery_app_customer/screens/home/home.dart';
import 'package:delivery_app_customer/screens/perfil/cartao.dart';
import 'package:delivery_app_customer/screens/perfil/endereco.dart';
import 'package:delivery_app_customer/screens/perfil/endereco_add.dart';
import 'package:delivery_app_customer/screens/perfil/pagamento.dart';
import 'package:delivery_app_customer/screens/user/user_sign_email.dart';
import 'package:delivery_app_customer/screens/user/user_sign_in.dart';
import 'package:delivery_app_customer/screens/user/user_sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App Customer',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: UserSignIn.routeName,
      routes: {
        UserSignIn.routeName: (context) => const UserSignIn(),
        UserSignInEmail.routeName: (context) => const UserSignInEmail(),
        UserSignUp.routeName: (context) => const UserSignUp(),
        Home.routeName: (context) => const Home(),
        Pagamento.routeName: (context) => const Pagamento(),
        Endereco.routeName: (context) => const Endereco(),
        EnderecoAdd.routeName: (context) => const EnderecoAdd(),
        Cartao.routeName: (context) => const Cartao(),
      },
    );
  }
}
