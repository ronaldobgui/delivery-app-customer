import 'package:delivery_app_customer/dto/cliente.dart';
import 'package:delivery_app_customer/repository/interface/repository.dart';

class ClienteService {
  final IRepository<Cliente> _clienteRepository;

  ClienteService(this._clienteRepository);

  Future<Cliente> add(Cliente cliente) async {
    return await _clienteRepository.add(cliente);
  }

  Future<List<Cliente>> all() async {
    return await _clienteRepository.all();
  }

  Future<void> delete(Cliente cliente) async {
    await _clienteRepository.all();
  }

  Future<Cliente?> get(int id) async {
    return await _clienteRepository.get(id);
  }

  Future<Cliente> update(Cliente cliente) async {
    return await _clienteRepository.update(cliente);
  }
}
