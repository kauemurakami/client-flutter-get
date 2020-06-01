import 'package:client_deno/controller/home.dart';
import 'package:client_deno/pages/home/widgets/floating_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX(
        init: HomeController(),
        builder: (_){
          return ListView.separated(
            itemBuilder: (context, index){
              return ListTile(
                title: Text('nome'),
                subtitle: Text('email'),
              );
            }, 
            separatorBuilder: (context, index)=> Divider(height: 2), 
            itemCount: 2
            );
        },
      ),
      floatingActionButton: FloatButtonWidget(),
    );
  }
}