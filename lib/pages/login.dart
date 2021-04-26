import 'package:app_pesquisa_pdm/models/usuarioModel.dart';
import 'package:flutter/material.dart';
import 'pagina_inicial.dart';
import 'cadastroUsuario.dart';
import 'cadastroEstabelecimento.dart';
import 'dart:core';
import 'package:flutter/cupertino.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  int _validador;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 40,
          left: 40,
          right: 40,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Text(
                'Pesquisa de satisfação', //${widget.user.score}
                style: TextStyle(fontSize: 24, color: Colors.indigo),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 250,
                height: 250,
                child: Image.asset('assets/images/login.png'),
              ),
              SizedBox(
                width: 10,
                height: 10,
              ),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  _email.text = value;
                  if (value == null || value.isEmpty) {
                    return 'Insira um e-mail cadastrado';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  _senha.text = value;
                  if (value == null || value.isEmpty) {
                    return 'Insira sua senha';
                  }
                  return null;
                },
              ),
              Container(
                height: 30,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text(
                    "Recuperar Senha",
                    style: TextStyle(color: Colors.indigo),
                  ),
                  onPressed: () {},
                ),
              ),
              RaisedButton(
                color: Colors.indigo,
                child: const Text('Entrar'),
                textColor: Colors.white,
                onPressed: () {
                  final isValid = _formKey.currentState.validate();
                  if (isValid) {
                    listUsuario(_email.text, _senha.text);
                    var validadeUsuario = listUsuario(_email.text, _senha.text);
                    if (validadeUsuario == true) {
                      _formKey.currentState.save();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PaginaInicial(), // redireciona para página de login
                        ),
                      );
                    } else {
                      error(context);
                    }
                  }
                },
              ),
              Container(
                height: 30,
                alignment: Alignment.center,
                child: FlatButton(
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(color: Colors.indigo, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CadastroUsuario() // redireciona para página de cadastro
                          ),
                    );
                  },
                ),
              ),
              Container(
                height: 30,
                alignment: Alignment.center,
                child: FlatButton(
                  child: Text(
                    "Solicitar cadastro de estabelecimento",
                    style: TextStyle(color: Colors.indigo, fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CadastroEstabelecimento() // redireciona para página de cadastro de estabelecimento
                          ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  error(BuildContext context) {
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Usuário/senha incorreto(s) ou usuário não cadastrado"),
          actions: [
            TextButton(
              // ignore: missing_required_param
              child: ElevatedButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
            ),
          ],
        );
      },
    ); // showDialog
  }
}
