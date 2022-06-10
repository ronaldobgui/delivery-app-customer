import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/repository.dart';

class UsuarioService {
  final IRepository<Usuario> _usuarioRepository;

  UsuarioService(this._usuarioRepository);

  Future<Usuario> add(Usuario dto) async {
    final _usuario = await _usuarioRepository.add(dto);
    _usuario.senha = '';
    return _usuario;
  }

  Future<List<Usuario>> all() async {
    return await _usuarioRepository.all();
  }

  Future<void> delete(Usuario dto) async {
    await _usuarioRepository.all();
  }

  Future<Usuario?> get(int id) async {
    return await _usuarioRepository.get(id);
  }

  Future<Usuario> update(Usuario dto) async {
    final _usuario = await _usuarioRepository.update(dto);
    _usuario.senha = '';
    return _usuario;
  }
}
