import 'dart:convert';
import 'package:client_deno/data/model/client.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = "http://192.168.1.5:3333/clients/";

class DenoApiClient {
  final http.Client httpClient;

  DenoApiClient({@required this.httpClient});

  getUsers() async {
    var response = await httpClient.get(baseUrl);
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<Client> clients = jsonResponse['clients'].map<Client>((map) {
        return Client.fromJson(map);
      }).toList();
      return clients;
    } else
      print('erro ao recuperar usuários');
  }

  getUser(id) async {
    var response = await httpClient.get('$baseUrl/$id');
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      Client client = jsonResponse['client'].map<Client>((map) {
        return Client.fromJson(map);
      }).toList();
      return client;
    } else
      print('erro ao recuperar usuário');
  }

  deleteUser(id) async {
    var response = await httpClient.delete('$baseUrl$id');
    print(id);
    print('$baseUrl/$id');
    if(response.statusCode == 200){
      return "Usuário excluido";
    }else { return "erro ao excluir usuário"; }
  }

}
