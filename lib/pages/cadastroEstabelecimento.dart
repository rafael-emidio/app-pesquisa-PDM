import 'dart:io';
import 'dart:ui';
import 'package:app_pesquisa_pdm/services/auth_service.dart';
import 'package:app_pesquisa_pdm/widget/ExibeImage.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'ImagePreview.dart';
import '../models/cadEstabelecimentoModel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera_camera/camera_camera.dart';
import 'checkauth.dart';

class CadastroEstabelecimento extends StatefulWidget {
  @override
  _CadastroEstabelecimento createState() => _CadastroEstabelecimento();
}

class _CadastroEstabelecimento extends State<CadastroEstabelecimento> {
  TextEditingController _nomeInputController = TextEditingController();
  TextEditingController _cnpjInputController = TextEditingController();
  TextEditingController _urlInputController = TextEditingController();
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _senhaInputController = TextEditingController();
  TextEditingController _confirmaSenhaInputController = TextEditingController();

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
            TextFormField(
                controller: _senhaInputController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Senha:'),
                validator: (_senhaInputController) {
                  if (_senhaInputController == null ||
                  _senhaInputController.isEmpty) {
                    return 'Insira uma senha';
                  }
                  if (_senhaInputController.length < 6) {
                    return 'Insira uma senha com no mínimo 6 caracteres';
                  }
                  return null;
                }
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
                        if (arquivo != null){
                          _gravarEstabelecimento();
                          _formKey.currentState.save();
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CheckAuth(), // redireciona para página de login
                            ),
                          );
                        }else{
                          error(context);
                        }
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

  void _gravarEstabelecimento() async{
    Future<String> url;
    CadEstabelecimentoModel novoEstabelecimento = CadEstabelecimentoModel(
      nome: _nomeInputController.text,
      cnpj: _cnpjInputController.text,
      url: arquivo.path,
      email: _emailInputController.text,
        senha: _senhaInputController.text
    );
    AuthService.to.criarEstabelecimento(novoEstabelecimento, arquivo);
  }
  error(BuildContext context) {
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Selecione uma imagem para a logo do estabelecimento"),
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
