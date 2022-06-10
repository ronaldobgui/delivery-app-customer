import 'package:delivery_app_customer/dto/endereco.dart';
import 'package:delivery_app_customer/repository/interface/repository.dart';

class EnderecoService {
  final IRepository<Endereco> _enderecoRepository;

  EnderecoService(this._enderecoRepository);

  Future<Endereco> add(Endereco endereco) async {
    return await _enderecoRepository.add(endereco);
  }

  Future<List<Endereco>> all() async {
    return await _enderecoRepository.all();
  }

  Future<void> delete(Endereco endereco) async {
    await _enderecoRepository.all();
  }

  Future<Endereco?> get(int id) async {
    return await _enderecoRepository.get(id);
  }

  Future<Endereco> update(Endereco endereco) async {
    return await _enderecoRepository.update(endereco);
  }
}
