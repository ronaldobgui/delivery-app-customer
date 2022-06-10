import 'package:delivery_app_customer/dto/usuario.dart';
import 'package:delivery_app_customer/repository/interface/repository.dart';

class UsuarioService {
  final IRepository<Usuario> _usuarioRepository;

  UsuarioService(this._usuarioRepository);

  Future<Usuario> add(Usuario dto) async {
    return await _usuarioRepository.add(dto);
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
    return await _usuarioRepository.update(dto);
  }
}
