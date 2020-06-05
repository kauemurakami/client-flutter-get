import 'package:client_deno/controller/client.dart';
import 'package:client_deno/controller/home.dart';
import 'package:client_deno/data/provider/deno_api.dart';
import 'package:client_deno/data/repository/client.dart';
import 'package:client_deno/pages/home/widgets/float_button.dart';
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
        assignId: true,
        init: HomeController(clientRepository: clientRepository),
        initState: (state) {
          Get.find<HomeController>().getUsers();
        },
        //autoRemove: false,
        builder: (_) {      
          if (_.clients.isNotEmpty) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        ClientController controller = Get.put(ClientController(
                            clientRepository: clientRepository));
                        controller.deleteUser(_.clients[index].id).then((data) {
                          _.clients.removeAt(index);
                          //Get.snackbar("Pronto", controller.message.value);
                        });
                      } else {

                      }
                    },
                    direction: DismissDirection.horizontal,
                    background: Container(
                        color: Colors.green,
                        child: Align(
                            alignment: Alignment(-0.9, 0),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ))),
                    secondaryBackground: Container(
                        color: Colors.red,
                        child: Align(
                            alignment: Alignment(0.9, 0),
                            child: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ))),
                    key: UniqueKey(),
                    child: ListTile(
                      onTap: () {
                        _.client = _.clients[index];
                        Get.toNamed('/panelClient');
                      },
                      title: Text(_.clients[index].name ?? "Nome"),
                      subtitle: Text(_.clients[index].email ?? "Email"),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(height: 2),
                itemCount: _.clients.length);
          } else {
            return LoadingWidget();
          }
        },
      ),
      floatingActionButton: FBWidget(),
    );
  }
}