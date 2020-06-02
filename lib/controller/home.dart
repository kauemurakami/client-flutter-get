import 'package:client_deno/data/model/client.dart';
import 'package:client_deno/data/repository/client.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends RxController {
  final ClientRepository clientRepository;

  HomeController({@required this.clientRepository}) : assert(clientRepository != null);

  final clients = List<Client>().obs;
  final _a = "aa".obs;

  get a => this._a.value;
  set a(value)=> this._a.value = value;
  
  getUsers() async {
    return await clientRepository.getClients();
  }

}