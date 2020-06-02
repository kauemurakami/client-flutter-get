import 'package:client_deno/data/provider/deno_api.dart';
import 'package:meta/meta.dart';

class ClientRepository {
  final DenoApiClient denoApiClient;

  ClientRepository({@required this.denoApiClient})
      : assert(denoApiClient != null);

  getClients() async {
    return denoApiClient.getUsers();
  }

}
