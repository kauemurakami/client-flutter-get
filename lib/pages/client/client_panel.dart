import 'package:client_deno/controller/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PanelClientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('usuario')),
        body: Container(
            padding: EdgeInsets.all(32),
            child: GetX<HomeController>(
              builder: (_) {
                return Column(
                  children: <Widget>[
                    Text(_.client.name, style: TextStyle(fontSize: 30, color: Colors.black),),
                    Text(_.client.email, style: TextStyle(fontSize: 30, color: Colors.black),),
                  ],
                );
              },
            )));
  }
}
