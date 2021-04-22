import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';

class CadastroUsuario extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome:'),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha com seu nome';
                  }
                  return null;
                },
                onSaved: (value) {
                  print(value);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail:'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha com seu e-mail';
                  }
                  return null;
                },
                onSaved: (value) {
                  print(value);
                },
              ),
              TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Senha:'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira uma senha';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    print(value);
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                  ),
                  ElevatedButton(
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      final isValid = _formKey.currentState.validate();
                      if (isValid) {
                        _formKey.currentState.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                LoginPage(), // redireciona para página de login
                          ),
                        );
                      }
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
