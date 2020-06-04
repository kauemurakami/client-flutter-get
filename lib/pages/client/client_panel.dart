import 'package:client_deno/controller/home.dart';
import 'package:client_deno/data/provider/deno_api.dart';
import 'package:client_deno/data/repository/client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PanelClientPage extends StatelessWidget {
  final ClientRepository clientRepository =
      ClientRepository(denoApiClient: DenoApiClient(httpClient: http.Client()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('usuario')),
      body: Container(
          padding: EdgeInsets.all(32),
          child: GetX<HomeController>(
            //assignId:  true,
            builder: (_) {
            return Column(
              children: <Widget>[
                Text(
                  _.client.name,
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Text(
                  _.client.email,
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ],
            );
          })),
    );
  }
}
