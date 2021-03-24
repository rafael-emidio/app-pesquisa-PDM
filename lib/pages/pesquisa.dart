import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/restauranteModel.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';
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

  int inteiro(valor) {
    return int.tryParse(valor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesquisa ' + widget.restaurante.nome),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                  'De 0 a 10, como você classificaria a qualidade da comida?',
                  style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _r1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite uma nota de 0 a 10',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Digite uma nota';
                  }
                  if (inteiro(value) == null) {
                    return 'Digite um número inteiro';
                  }
                  if (inteiro(value) < 0) {
                    return 'Digite uma nota de 0 a 10';
                  }
                  if (inteiro(value) > 10) {
                    return 'Digite uma nota de 0 a 10';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                  'De 0 a 10, como você classificaria a qualidade do atendimento?',
                  style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _r2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite uma nota de 0 a 10',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Digite uma nota';
                  }
                  if (inteiro(value) == null) {
                    return 'Digite um número inteiro';
                  }
                  if (inteiro(value) < 0) {
                    return 'Digite uma nota de 0 a 10';
                  }
                  if (inteiro(value) > 10) {
                    return 'Digite uma nota de 0 a 10';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                  'De 0 a 10, como você classificaria a velocidade do serviço?',
                  style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _r3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite uma nota de 0 a 10',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Digite uma nota';
                  }
                  if (inteiro(value) == null) {
                    return 'Digite um número inteiro';
                  }
                  if (inteiro(value) < 0) {
                    return 'Digite uma nota de 0 a 10';
                  }
                  if (inteiro(value) > 10) {
                    return 'Digite uma nota de 0 a 10';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                  'De 0 a 10, como você classificaria o custo benefício?',
                  style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _r4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite uma nota de 0 a 10',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Digite uma nota';
                  }
                  if (inteiro(value) == null) {
                    return 'Digite um número inteiro';
                  }
                  if (inteiro(value) < 0) {
                    return 'Digite uma nota de 0 a 10';
                  }
                  if (inteiro(value) > 10) {
                    return 'Digite uma nota de 0 a 10';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                  'De 0 a 10, qual a chance de você indicar esse restaurante pra algum amigo ou familiar?',
                  style: TextStyle(fontSize: 16)),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: TextFormField(
                controller: _r5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite uma nota de 0 a 10',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Digite uma nota';
                  }
                  if (inteiro(value) == null) {
                    return 'Digite um número inteiro';
                  }
                  if (inteiro(value) < 0) {
                    return 'Digite uma nota de 0 a 10';
                  }
                  if (inteiro(value) > 10) {
                    return 'Digite uma nota de 0 a 10';
                  }
                  return null;
                },
              ),
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
                  if (_formKey.currentState.validate()) {
                    this.pesquisa = PesquisaModel(
                        1,
                        1,
                        widget.restaurante.id,
                        inteiro(_r1.text),
                        inteiro(_r2.text),
                        inteiro(_r3.text),
                        inteiro(_r4.text),
                        inteiro(_r5.text),
                        _comentario.text);
                    widget.onSave(this.pesquisa);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.auto_awesome),
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
}
