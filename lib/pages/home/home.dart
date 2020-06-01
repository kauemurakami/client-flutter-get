import 'package:client_deno/controller/home.dart';
import 'package:client_deno/data/model/client.dart';
import 'package:client_deno/data/provider/deno_api.dart';
import 'package:client_deno/data/repository/client.dart';
import 'package:client_deno/pages/home/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ClientRepository clientRepository = ClientRepository(
        denoApiClient: DenoApiClient(
      httpClient: http.Client(),
    ));
    return Scaffold(
      body: GetX<HomeController>(
        init: HomeController(clientRepository: clientRepository),
        initState: (state){ Get.find<HomeController>().getUsers(); Get.find<HomeController>().a = "bb";},
        builder: (_) {
          final clients = _.clients;      
          
          return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_.a),
                  subtitle: Text('email'),
                );
              },
              separatorBuilder: (context, index) => Divider(height: 2),
              itemCount: 2);
        },
      ),
      floatingActionButton: FloatButtonWidget(),
    );
  }
}
