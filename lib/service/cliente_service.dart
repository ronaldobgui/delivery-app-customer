import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/repository/interface/repository.dart';

class ClienteService {
  final IRepository<Cliente> _clienteRepository;

  ClienteService(this._clienteRepository);

  Future<void> add(Cliente dto) async {
    await _clienteRepository.add(dto);
  }

  Future<List<Cliente>> all() async {
    return await _clienteRepository.all();
  }

  Future<void> delete(Cliente dto) async {
    await _clienteRepository.all();
  }

  Future<Cliente?> get(String id) async {
    return await _clienteRepository.get(id);
  }

  Future<void> update(Cliente dto) async {
    return await _clienteRepository.update(dto);
  }
}
