import 'package:client_deno/controller/home.dart';
import 'package:client_deno/data/provider/deno_api.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ClientRepository {
  final DenoApiClient denoApiClient;

  ClientRepository({@required this.denoApiClient})
      : assert(denoApiClient != null);
  
  getUsers(){
    return denoApiClient.getUsers();
  }

  getUser(id){
    return denoApiClient.getUser(id);
  }

  deleteUser(id){
    return denoApiClient.deleteUser(id);
  }

  addUser(client){
    return denoApiClient.addUser(client);
  }
}
