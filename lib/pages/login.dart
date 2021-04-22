import 'package:flutter/material.dart';
import 'pagina_inicial.dart';
import 'cadastro.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 40,
          left: 40,
          right: 40,
        ),
        child: ListView(
          key: _formKey,
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PaginaInicial() // redireciona para página inicial
                          ));
                }),
            RaisedButton(
                color: Colors.indigo,
                child: const Text('Entrar como Estabelecimento'),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PaginaInicial() // redireciona para página inicial
                          ));
                }),
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
                              Cadastro() // redireciona para página inicial
                          ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
