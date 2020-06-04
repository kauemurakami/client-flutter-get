import 'dart:convert';
import 'package:client_deno/data/model/client.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = "http://192.168.1.5:3333/clients/";

class DenoApiClient {
  final http.Client httpClient;

  DenoApiClient({@required this.httpClient});

  getUsers() async {
    try {
      var response = await httpClient.get(baseUrl);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<Client> clients = jsonResponse['clients'].map<Client>((map) {
          return Client.fromJson(map);
        }).toList();
        return clients;
      } else
        print('erro ao recuperar usuários');
    } finally { disposeClient();}
  }

  getUser(id) async {
    try {
      var response = await httpClient.get('$baseUrl/$id');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        Client client = jsonResponse['client'].map<Client>((map) {
          return Client.fromJson(map);
        }).toList();
        return client;
      } else
        print('erro ao recuperar usuário');
    } finally { disposeClient();}
  }

  addUser(client) async {
    print(client);
    try {
      var response = await httpClient.post(baseUrl, headers: {"Content-Type":"application/json"}, body: jsonEncode(client));
      if (response.statusCode == 200) {
        return "Cliente inserido com sucesso";
      } else
        print('erro ao adicionar usuário');
    } finally { disposeClient();}
  }

  deleteUser(id) async {
    try {
      var response = await http.delete('$baseUrl$id');
      if (response.statusCode == 200) {
        return "Usuário excluido";
      } else {
        return "erro ao excluir usuário";
      }
    } finally { disposeClient();}
  }

  disposeClient() {
    this.httpClient.close();
  }
}
