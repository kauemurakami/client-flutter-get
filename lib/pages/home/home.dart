import 'package:client_deno/controller/home.dart';
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
    return Scaffold(
      body: GetX<HomeController>(
        init: HomeController(clientRepository: clientRepository),
        initState: (state) {
          Get.find<HomeController>().a = "bb";
        },
        builder: (_) {
          return FutureBuilder(
              future: _.getUsers(),
              builder: (context, snapshot) {
                        print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.active) 
                if (snapshot.connectionState == ConnectionState.waiting) {return Center(child: CircularProgressIndicator());}
                if (snapshot.connectionState == ConnectionState.none) 
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_.a),
                          subtitle: Text('clients[0].name'),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(height: 2),
                      itemCount: 2);
                }
              return Container();
              });
        },
      ),
      floatingActionButton: FloatButtonWidget(),
    );
  }
}
