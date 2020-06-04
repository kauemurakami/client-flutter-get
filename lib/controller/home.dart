import 'package:client_deno/data/model/client.dart';
import 'package:client_deno/data/repository/client.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class HomeController extends RxController {
  final ClientRepository clientRepository;

  HomeController({@required this.clientRepository})
      : assert(clientRepository != null);

  //List<Client>clients = List<Client>().obs;
  final _clients = List<Client>().obs;
  final _client = Client().obs;

  get client => this._client.value;
  set client(value) => this._client.value = value;

  List<Client> get clients => this._clients.value;
  set clients(value) => this._clients.value = value;

  getUsers(){
    clientRepository.getUsers().then((data) {
      this.clients = data;
    });
  }

}
