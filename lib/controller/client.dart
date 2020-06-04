import 'package:client_deno/data/repository/client.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ClientController extends RxController {
  final ClientRepository clientRepository;

  ClientController({@required this.clientRepository})
      : assert(clientRepository != null);

  final message = "".obs;

  deleteUser(id) async {
    return await clientRepository.deleteUser(id).then((data){
      this.message.value = data;
    });
  }

}