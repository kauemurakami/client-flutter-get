import 'package:client_deno/controller/home.dart';
import 'package:client_deno/data/model/client.dart';
import 'package:client_deno/data/repository/client.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ClientController extends RxController {
  final ClientRepository clientRepository;

  ClientController({@required this.clientRepository})
      : assert(clientRepository != null);

  final message = "".obs;
  final _client = Client().obs;
  
  get client => this._client.value;
  set client(value) => this._client.value = value;

  deleteUser(id) async {
    return await clientRepository.deleteUser(id).then((data){
      this.message.value = data;
    });
  }
   getUser(id){
    clientRepository.getUser(id).then((data) {
      this.client.value = data;
    });
  }
  addUser(client){
    clientRepository.addUser(client);
  }
}