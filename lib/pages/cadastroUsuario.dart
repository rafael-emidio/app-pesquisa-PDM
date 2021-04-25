import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';
import '../models/usuarioModel.dart';

class CadastroUsuario extends StatefulWidget {
  @override
  _CadastroUsuario createState() => _CadastroUsuario();
}

class _CadastroUsuario extends State<CadastroUsuario> {
  TextEditingController _nomeInputController = TextEditingController();
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _senhaInputController = TextEditingController();
  TextEditingController _confirmaSenhaInputController = TextEditingController();

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
                  controller: _nomeInputController,
                  decoration: InputDecoration(labelText: 'Nome:'),
                  keyboardType: TextInputType.text,
                  validator: (_nomeInputController) {
                    if (_nomeInputController == null ||
                        _nomeInputController.isEmpty) {
                      return 'Preencha com seu nome';
                    }
                    return null;
                  }
                  /*onSaved: (value) {
                  print(value);
                },*/
                  ),
              TextFormField(
                  controller: _emailInputController,
                  decoration: InputDecoration(labelText: 'E-mail:'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (_emailInputController) {
                    if (_emailInputController == null ||
                        _emailInputController.isEmpty) {
                      return 'Preencha com seu e-mail';
                    }
                    return null;
                  }
                  /*onSaved: (value) {
                  print(value);
                },*/
                  ),
              TextFormField(
                  controller: _senhaInputController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Senha:'),
                  validator: (_senhaInputController) {
                    if (_senhaInputController == null ||
                        _senhaInputController.isEmpty) {
                      return 'Insira uma senha';
                    }
                    return null;
                  }
                  /*onSaved: (value) {
                  print(value);
                },*/
                  ),
              TextFormField(
                controller: _confirmaSenhaInputController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirme a senha:'),
                validator: (_confirmaSenhaInputController) {
                  if (_confirmaSenhaInputController == null ||
                      _confirmaSenhaInputController.isEmpty) {
                    return 'Confirme a senha';
                  }
                  if (_senhaInputController.text !=
                      _confirmaSenhaInputController) {
                    return 'As senha não coincidem, tente novamente';
                  }
                  return null;
                },
                /*onSaved: (value) {
                  print(value);
                },*/
              ),
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
                        _gravar();
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

  void _gravar() {
    UsuarioModel novoUsuario = UsuarioModel(
      nome: _nomeInputController.text,
      email: _emailInputController.text,
      senha: _senhaInputController.text,
      confirmaSenha: _confirmaSenhaInputController.text,
    );
    print(novoUsuario); //apenas para printar, retirar depois
  }
}
