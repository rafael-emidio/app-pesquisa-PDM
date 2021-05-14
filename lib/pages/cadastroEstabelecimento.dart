import 'dart:io';

import 'package:brasil_fields/brasil_fields.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'login.dart';
import '../models/cadEstabelecimentoModel.dart';

class CadastroEstabelecimento extends StatefulWidget {
  @override
  _CadastroEstabelecimento createState() => _CadastroEstabelecimento();
}

class _CadastroEstabelecimento extends State<CadastroEstabelecimento> {
  TextEditingController _nomeInputController = TextEditingController();
  TextEditingController _cnpjInputController = TextEditingController();
  TextEditingController _urlInputController = TextEditingController();
  TextEditingController _emailInputController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  File arquivo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Cadastro Estabelecimento'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nomeInputController,
                decoration:
                    InputDecoration(labelText: 'Nome do Estabelecimento:'),
                keyboardType: TextInputType.text,
                validator: (_nomeInputController) {
                  if (_nomeInputController == null ||
                      _nomeInputController.isEmpty) {
                    return 'Preencha o nome do Restaurante';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cnpjInputController,
                decoration: InputDecoration(labelText: 'CNPJ:'),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CnpjInputFormatter(),
                ],
                validator: (_cnpjInputController) {
                  if (_cnpjInputController == null ||
                      _cnpjInputController.isEmpty) {
                    return 'Preencha com o CNPJ do estabelecimento';
                  }
                  if (GetUtils.isCnpj(_cnpjInputController)) {
                    return null;
                  } else {
                    return 'CNPJ inválido';
                  }
                },
              ),
              TextFormField(
                controller: _emailInputController,
                decoration: InputDecoration(labelText: 'E-mail:'),
                keyboardType: TextInputType.emailAddress,
                validator: (_emailInputController) {
                  if (_emailInputController == null ||
                      _emailInputController.isEmpty) {
                    return 'Preencha com um e-mail para contato';
                  }
                  return null;
                },
              ),
              /*TextFormField(
                controller: _urlInputController,
                decoration: InputDecoration(labelText: 'Url da logo:'),
                keyboardType: TextInputType.text,
                validator: (_urlInputController) {
                  if (_urlInputController == null ||
                      _urlInputController.isEmpty) {
                    return 'Preencha com a Url da logo de seu Restaurante';
                  }
                  return null;
                },
              ),*/
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 40),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => {},
                    icon: Icon(Icons.camera_alt),
                    label: Text('Tirar Foto'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.attach_file),
                      label: Text('Escolher Imagem'))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
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
    CadEstabelecimentoModel novoEstabelecimento = CadEstabelecimentoModel(
      nome: _nomeInputController.text,
      cnpj: _cnpjInputController.text,
      url: _urlInputController.text,
      email: _emailInputController.text,
    );
    print(novoEstabelecimento); //apenas para printar, retirar depois
  }
}
