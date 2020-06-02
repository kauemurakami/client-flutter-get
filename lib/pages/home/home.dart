import 'package:client_deno/controller/home.dart';
import 'package:client_deno/data/provider/deno_api.dart';
import 'package:client_deno/data/repository/client.dart';
import 'package:client_deno/pages/home/widgets/floating_button.dart';
import 'package:client_deno/pages/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  final ClientRepository clientRepository =
      ClientRepository(denoApiClient: DenoApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<HomeController>(
        init: HomeController(clientRepository: clientRepository),
        initState: (state) {
          Get.find<HomeController>().getUsers();
        },
        builder: (_) {
          print(_.clients);
          if (_.clients.isNotEmpty) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_.clients[index].name ?? "Nome"),
                    subtitle: Text(_.clients[index].email ?? "Email"),
                  );
                },
                separatorBuilder: (context, index) => Divider(height: 2),
                itemCount: _.clients.length
                );

          }else { return LoadingWidget(); }
        },
      ),
      floatingActionButton: FloatButtonWidget(),
    );
  }
}
