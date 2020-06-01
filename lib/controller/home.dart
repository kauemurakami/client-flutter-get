import 'package:client_deno/data/model/client.dart';
import 'package:client_deno/data/repository/client.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends RxController {
  final ClientRepository clientRepository;

  HomeController({@required this.clientRepository}) : assert(clientRepository != null);

  final _clients = List<Client>().obs;
  final _a = "aa".obs;

  get a => this._a.value;
  set a(value)=> this._a.value = value;

  get clients => this._clients;
  set clients(value)=> this._clients.value = value;
  
  getUsers() async{
    clients = await clientRepository.getClients();
  }
}