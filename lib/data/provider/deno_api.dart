import 'dart:io';

import 'package:client_deno/data/model/client.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DenoApiClient {
  final baseUrl = 'http://172.28.0.1:3333/clients';
  final http.Client httpClient;

  DenoApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<Client>> getUsers() async {

    final response = await httpClient.get(baseUrl);

    if (response.statusCode == 200) {

      final json = jsonDecode(response.body);
      List<Client> clients = json.map<Client>((map) {
        return Client.fromJson(map);
      }).toList();

      print(clients);

      return clients;
    } else {
      print('erro api');
    }
    print(response.statusCode.toString());
  }
}
