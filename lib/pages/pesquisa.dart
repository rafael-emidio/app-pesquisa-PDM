import 'package:app_pesquisa_pdm/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/restauranteModel.dart';
import '../models/pesquisaModel.dart';

class Pesquisa extends StatefulWidget {
  RestauranteModel restaurante;
  ValueChanged<PesquisaModel> onSave;

  Pesquisa({Key key, this.restaurante, this.onSave}) : super(key: key);

  @override
  _PesquisaState createState() => _PesquisaState();
}

class _PesquisaState extends State<Pesquisa> {
  final _r1 = TextEditingController();
  final _r2 = TextEditingController();
  final _r3 = TextEditingController();
  final _r4 = TextEditingController();
  final _r5 = TextEditingController();
  final _comentario = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  PesquisaModel pesquisa;

  @override
  void initState() {
    super.initState();
  }

  //método que transforma texto em inteiro, retorna null em caso de erro
  int inteiro(String valor) {
    //converte string para double
    var doub = double.tryParse(valor);
    //remove o ponto e converte para string
    return int.tryParse(doub.round().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisa: ' + widget.restaurante.nome),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                  'De 1 a 5, como você classificaria a qualidade da comida?',
                  style: TextStyle(fontSize: 16)),
            ),
            //Escala de avaliação de 1 a 5, onde faz a verificação em qual satisfação o usuário escolherá
            //retornando um valor double é convertido em string
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: 0,
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    switch (i) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                      case 3:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                        );
                      case 4:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                        );
                      default:
                        return null;
                    }
                  },
                  onRatingUpdate: (rating) {
                    _r1.text = rating.toString();
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                  'De 1 a 5, como você classificaria a qualidade do atendimento?',
                  style: TextStyle(fontSize: 16)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: 0,
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    switch (i) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                      case 3:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                        );
                      case 4:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                        );
                      default:
                        return null;
                    }
                  },
                  onRatingUpdate: (rating) {
                    _r2.text = rating.toString();
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                  'De 1 a 5, como você classificaria a velocidade do serviço?',
                  style: TextStyle(fontSize: 16)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: 0,
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    switch (i) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                      case 3:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                        );
                      case 4:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                        );
                      default:
                        return null;
                    }
                  },
                  onRatingUpdate: (rating) {
                    _r3.text = rating.toString();
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                  'De 1 a 5, como você classificaria o custo benefício?',
                  style: TextStyle(fontSize: 16)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: 0,
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    switch (i) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                      case 3:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                        );
                      case 4:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                        );
                      default:
                        return null;
                    }
                  },
                  onRatingUpdate: (rating) {
                    _r4.text = rating.toString();
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                  'De 1 a 5, qual a chance de você indicar esse restaurante pra algum amigo ou familiar?',
                  style: TextStyle(fontSize: 16)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                  initialRating: 0,
                  itemCount: 5,
                  itemBuilder: (context, i) {
                    switch (i) {
                      case 0:
                        return Icon(
                          Icons.sentiment_very_dissatisfied,
                          color: Colors.red,
                        );
                      case 1:
                        return Icon(
                          Icons.sentiment_dissatisfied,
                          color: Colors.redAccent,
                        );
                      case 2:
                        return Icon(
                          Icons.sentiment_neutral,
                          color: Colors.amber,
                        );
                      case 3:
                        return Icon(
                          Icons.sentiment_satisfied,
                          color: Colors.lightGreen,
                        );
                      case 4:
                        return Icon(
                          Icons.sentiment_very_satisfied,
                          color: Colors.green,
                        );
                      default:
                        return null;
                    }
                  },
                  onRatingUpdate: (rating) {
                    _r5.text = rating.toString();
                  },
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('Gostaria de adicionar algum comentário? (Opicional)',
                  style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _comentario,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite seu comentário aqui',
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  return null;
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(24.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_r1.text == '' ||
                      _r1.text == '0.0' ||
                      _r2.text == '' ||
                      _r2.text == '0.0' ||
                      _r3.text == '' ||
                      _r3.text == '0.0' ||
                      _r4.text == '' ||
                      _r4.text == '0.0' ||
                      _r5.text == '' ||
                      _r5.text == '0.0') {
                    error(context);
                  } else {
                    if (_formKey.currentState.validate()) {
                      this.pesquisa = PesquisaModel(
                        AuthService.to.user.uid,
                        widget.restaurante.id.toString(),
                        inteiro(_r1.text),
                        inteiro(_r2.text),
                        inteiro(_r3.text),
                        inteiro(_r4.text),
                        inteiro(_r5.text),
                        _comentario.text);
                      _gravarPesquisa(this.pesquisa);
                      widget.onSave(this.pesquisa);
                    }
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.description),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text('Responder', style: TextStyle(fontSize: 20)),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _gravarPesquisa(PesquisaModel pesq) async{
    AuthService.to.cadastrarPesquisa(pesq);
  }

  error(BuildContext context) {
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Responda todas as perguntas de 1 a 5"),
          content: Text("Escala em cinza quer dizer não preenchida."),
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
