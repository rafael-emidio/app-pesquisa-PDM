import 'dart:io';
import 'dart:ui';
import 'package:app_pesquisa_pdm/widget/ExibeImage.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'ImagePreview.dart';
import 'login.dart';
import '../models/cadEstabelecimentoModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera_camera/camera_camera.dart';

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
  final picker = ImagePicker();

  showPreview(file) async {
    file = await Get.to(() => ImagePreview(file: file));

    if (file != null) {
      setState(() => arquivo = file);
      Get.back();
    }
  }

  Future getFileFromGallery() async {
    final file = await picker.getImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() => arquivo = File(file.path));
    }
  }

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
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Escolha uma imagem para logo",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70, left: 40),
                  ),
                  ElevatedButton.icon(
                    onPressed: () => Get.to(
                      () => CameraCamera(onFile: (file) => showPreview(file)),
                    ),
                    icon: Icon(Icons.camera_alt),
                    label: Text('Tirar Foto'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                  ),
                  ElevatedButton.icon(
                      onPressed: () => getFileFromGallery(),
                      icon: Icon(Icons.attach_file),
                      label: Text('Escolher Imagem'))
                ],
              ),
              if (arquivo != null) ExibeImage(arquivo: arquivo),
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
    CadEstabelecimentoModel novoEstabelecimento = CadEstabelecimentoModel(
      nome: _nomeInputController.text,
      cnpj: _cnpjInputController.text,
      url: _urlInputController.text,
      email: _emailInputController.text,
    );
    print(novoEstabelecimento); //apenas para printar, retirar depois
  }
}
