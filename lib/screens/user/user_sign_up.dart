import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/cliente_repository.dart';
import 'package:delivery_app_customer/repository/interface/repository.dart';
import 'package:delivery_app_customer/repository/usuario_repository.dart';
import 'package:delivery_app_customer/screens/component/full_scroll.dart';
import 'package:delivery_app_customer/screens/home/home.dart';
import 'package:delivery_app_customer/screens/mask/cpf_mask.dart';
import 'package:delivery_app_customer/screens/mask/date_mask.dart';
import 'package:delivery_app_customer/screens/mask/phone_mask.dart';
import 'package:delivery_app_customer/service/authentication_service.dart';
import 'package:delivery_app_customer/service/cliente_service.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserSignUp extends StatefulWidget {
  static const String routeName = '/user-sign-up';

  const UserSignUp({Key? key}) : super(key: key);

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  final _formKey = GlobalKey<FormState>();

  late final TextInputMask _cpfMask;
  late final TextInputMask _phoneMask;
  late final TextInputMask _dateMask;

  late final IRepository<Usuario> _usuarioRepository;
  late final IRepository<Cliente> _clienteRepository;

  late final ClienteService _clienteService;

  late final AuthenticationService _auth;

  final _dateFormat = DateFormat('dd/MM/yyyy');

  Cliente _cliente = Cliente();
  Usuario _usuario = Usuario();

  @override
  void initState() {
    super.initState();
    _cpfMask = getCpfMask();
    _phoneMask = getPhoneMask();
    _dateMask = getDateMask();
    //
    _usuarioRepository = UsuarioFirebaseRepository();
    _clienteRepository = ClienteFirebaseRepository();
    //
    _clienteService = ClienteService(_clienteRepository);
    //
    _auth = AuthenticationService(_usuarioRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crie a sua conta'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return FullScroll(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: _usuario.nome,
                      onSaved: (value) {
                        _usuario.nome = value!;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Nome',
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O nome não pode ser vazio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: _cliente.cpf,
                      onSaved: (value) {
                        _cliente.cpf = value!.replaceAll(RegExp(r'\D'), '');
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'CPF',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        _cpfMask,
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O CPF não pode ser vazio';
                        }
                        if (value.length < 14) {
                          return 'CPF inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
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
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        _phoneMask,
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O telefone não pode ser vazio';
                        }
                        if (value.length < 14) {
                          return 'Telefone inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: _usuario.email,
                      onSaved: (value) {
                        _usuario.email = value!;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'O email não pode ser vazio';
                        }
                        if (EmailValidator.validate(value) == false) {
                          return 'Email inválido';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: _cliente.dataNascimento != null ? _dateFormat.format(_cliente.dataNascimento!) : null,
                      onSaved: (value) {
                        _cliente.dataNascimento = _dateFormat.parse(value!);
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Data de nascimento',
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        _dateMask,
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'A data de nascimento não pode ser vazia';
                        }
                        if (value.length < 10) {
                          return 'Data de nascimento inválida';
                        }
                        return null;
                      },
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'A senha não pode ser vazia';
                        }
                        if (value.length < 8) {
                          return 'A senha deve ter pelo menos 8 caracteres';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      initialValue: '',
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirme a Senha',
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'A senha não pode ser vazia';
                        }
                        if (value.length < 8) {
                          return 'A senha deve ter pelo menos 8 caracteres';
                        }
                        if (value != _usuario.senha) {
                          return 'As senhas não correspondem';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      child: const Text('Cadastrar'),
                      onPressed: () async {
                        var state = _formKey.currentState;
                        if (state != null) {
                          state.save();
                        }
                        if (state != null && state.validate()) {
                          try {
                            _usuario = await _auth.signUp(_usuario);
                            _cliente.usuarioId = _usuario.id;
                            _cliente = await _clienteService.add(_cliente);
                            //
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
                                        Text('Erro ao cadastrar cliente'),
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
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                      ),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
