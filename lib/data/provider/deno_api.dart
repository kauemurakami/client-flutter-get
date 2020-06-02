import 'dart:convert';
import 'package:client_deno/data/model/client.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

const baseUrl = "http://192.168.1.5:3333/clients/";

class DenoApiClient {
  final http.Client httpClient;

  DenoApiClient({@required this.httpClient});

  getUsers() async {
    http.Response response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      List<Client> clients = jsonResponse['clients'].map<Client>((map) {
        return Client.fromJson(map);
      }).toList();
      return clients;
    } else
      print('erro ao recuperar usuários');
  }

/*
  Future<List<Client>> getUsers() async {
    final response = await this.httpClient.get(baseUrl);
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> dadosJson = json.decode(response.body) ;
      List<Client> clients = dadosJson.map<Client>(
        (map){
          return Client.fromJson(map);
        }
      ).toList();
    } else {
      print('erro api');
    }
  }
  */
}
