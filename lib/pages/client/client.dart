import 'package:client_deno/controller/client.dart';
import 'package:client_deno/controller/home.dart';
import 'package:client_deno/data/provider/deno_api.dart';
import 'package:client_deno/data/repository/client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:validators/validators.dart';

class DataClientPage extends StatelessWidget {
  final ClientRepository clientRepository =
      ClientRepository(denoApiClient: DenoApiClient(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    final GlobalKey formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Usuário"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: GetX<ClientController>(
            autoRemove: false,
            init: ClientController(clientRepository: clientRepository),
            builder: (_) {
              Get.arguments == null
                  ? _.client = _.client
                  : _.client = Get.arguments;
              return Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onSaved: (value) => value != null
                          ? _.client.name = value
                          : _.client.name = _.client.name,
                      decoration: InputDecoration(labelText: "Nome"),
                      enableSuggestions: true,
                      maxLength: 40,
                      validator: (value) {
                        if (value.isEmpty || value.length < 3) {
                          return "Insira um nome";
                        } else
                          return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) => value != null
                          ? _.client.email = value
                          : _.client.email = _.client.email,
                      decoration: InputDecoration(labelText: "Email"),
                      enableSuggestions: true,
                      maxLength: 32,
                      validator: (value) {
                        if (!isEmail(value)) {
                          return "Insira um email válido";
                        } else
                          return null;
                      },
                    ),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        onSaved: (value) => value != null
                            ? _.client.password = value
                            : _.client.password = _.client.password,
                        decoration: InputDecoration(labelText: "Senha"),
                        enableSuggestions: true,
                        obscureText: true,
                        maxLength: 20,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Insira uma senha";
                          } else if (value.length < 5) {
                            return "Insira uma senha maior";
                          } else
                            return null;
                        }),
                    Get.arguments == null
                        ? RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.blue,
                            splashColor: Colors.lightBlueAccent,
                            onPressed: () {
                              final FormState form = formKey.currentState;
                              if (form.validate()) {
                                form.save();
                                _.addUser(_.client);
                                Get.offAllNamed('/');
                              } else {
                                //snackbar
                                print('erro ao salvar');
                              }
                            },
                            child: Text("Adicionar",
                                style: TextStyle(color: Colors.white)),
                          )
                        : RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.blue,
                            splashColor: Colors.lightBlueAccent,
                            onPressed: () {
                              final FormState form = formKey.currentState;
                              if (form.validate()) {
                                form.save();
                                _.editUser(_.client);
                                Get.offAllNamed('/');
                              } else {
                                //snackbar
                                print('erro ao salvar');
                              }
                            },
                            child: Text("Editar",
                                style: TextStyle(color: Colors.white)),
                          ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      color: Colors.red,
                      child: Text(
                        "Cancelar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Get.offAllNamed('/');
                      },
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
