import 'package:delivery_app_customer/screens/home/home.dart';
import 'package:delivery_app_customer/screens/perfil/cartao.dart';
import 'package:delivery_app_customer/screens/perfil/pagamento.dart';
import 'package:delivery_app_customer/screens/user/user_sign_email.dart';
import 'package:delivery_app_customer/screens/user/user_sign_in.dart';
import 'package:delivery_app_customer/screens/user/user_sign_up.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(
    const App(),
  );
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
        Cartao.routeName: (context) => const Cartao(),
      },
    );
  }
}
