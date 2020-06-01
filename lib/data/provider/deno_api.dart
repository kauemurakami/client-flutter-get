import 'package:client_deno/data/model/client.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DenoApiClient{
  final baseUrl = 'https://localhost:333/clients';

  Future<List<Client>> getUsers() async{
    final response = await http.get(baseUrl);
    if(response.statusCode != 200){
      throw Exception('erro ao recuperar usuários');
    }else if(response.statusCode == 200){
      final json = jsonDecode(response.body) as List;
      List<Client> clients = json.map<Client>(
        (map){
          return Client.fromJson(map);
        }
      ).toList();
      return clients;
    }
  }

}