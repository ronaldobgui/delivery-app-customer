import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/repository.dart';
import 'package:delivery_app_customer/repository/usuario_repository.dart';
import 'package:delivery_app_customer/screens/component/full_scroll.dart';
import 'package:delivery_app_customer/screens/home/home.dart';
import 'package:delivery_app_customer/screens/mask/phone_mask.dart';
import 'package:delivery_app_customer/screens/user/user_sign_email.dart';
import 'package:delivery_app_customer/screens/user/user_sign_up.dart';
import 'package:delivery_app_customer/service/authentication_service.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

class UserSignIn extends StatefulWidget {
  static const String routeName = '/user-sign-in';

  const UserSignIn({Key? key}) : super(key: key);

  @override
  State<UserSignIn> createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  final _formKey = GlobalKey<FormState>();

  Usuario _usuario = Usuario();

  late final IRepository<Usuario> _usuarioRepository;
  late final AuthenticationService _auth;

  late final TextInputMask _phoneMask;

  @override
  void initState() {
    super.initState();
    _phoneMask = getPhoneMask();
    _usuario.telefone = _phoneMask.magicMask.getMaskedString(_usuario.telefone);
    //
    _usuarioRepository = UsuarioFirebaseRepository();
    _auth = AuthenticationService(_usuarioRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return FullScroll(
          child: Padding(
            padding: const EdgeInsets.all(15),
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
                    initialValue: _usuario.telefone,
                    onSaved: (value) {
                      _usuario.telefone = value!.replaceAll(RegExp(r'\D'), '');
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Telefone',
                    ),
                    inputFormatters: [
                      _phoneMask,
                    ],
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    initialValue: _usuario.senha,
                    onSaved: (value) {
                      _usuario.senha = value!;
                    },
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
                    child: const Text(
                      'Entrar',
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                    ),
                    onPressed: () async {
                      var state = _formKey.currentState;
                      if (state != null) {
                        state.save();
                      }
                      if (state != null && state.validate()) {
                        try {
                          _usuario = await _auth.signIn(_usuario);
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            Home.routeName,
                            (route) => false,
                          );
                        }
                        //
                        catch (error) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Erro'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: const [
                                      Text('Telefone ou senha incorretos'),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
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
                      padding: const EdgeInsets.all(15),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(UserSignInEmail.routeName);
                    },
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
      }),
    );
  }
}
