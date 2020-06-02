import 'package:client_deno/controller/home.dart';
import 'package:client_deno/data/model/client.dart';
import 'package:client_deno/data/provider/deno_api.dart';
import 'package:client_deno/data/repository/client.dart';
import 'package:client_deno/pages/home/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  final ClientRepository clientRepository =
      ClientRepository(denoApiClient: DenoApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    List<Client> _clients;
    return Scaffold(
      body: GetX<HomeController>(
        initState: (state) {
          Get.find<HomeController>().getUsers().then((data) => _clients = data) ;
          Get.find<HomeController>().a = "bb";
        },
        builder: (_) {
          print(_clients);
          return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_.a),
                  subtitle: Text('snapshot.data[index].email'),
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
