import 'package:flutter/material.dart';

class DataClientPage extends StatelessWidget {
  final formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
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
                decoration: InputDecoration(labelText: "Email"),
                enableSuggestions: true,
                maxLength: 32,
                validator: (value) {
                  if (value.isEmpty || !value.contains('@')) {
                    return "Insira um email válido";
                  } else
                    return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Senha"),
                enableSuggestions: true,
                obscureText: true,
                maxLength: 20,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Insira uma senha válida";
                  } else
                    return null;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
