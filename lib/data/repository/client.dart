import 'package:client_deno/data/provider/deno_api.dart';
import 'package:meta/meta.dart';

class ClientRepository {
  final DenoApiClient denoApiClient;

  ClientRepository({@required this.denoApiClient})
      : assert(denoApiClient != null);

  getUsers() async {
    return denoApiClient.getUsers();
  }

  getUser(id) async {
    return denoApiClient.getUser(id);
  }

  deleteUser(id) {
    return denoApiClient.deleteUser(id);
  }
}
