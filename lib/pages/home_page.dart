import 'package:flutter/material.dart';
import 'score_page.dart';

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ScorePage()));
            },
            child: Text("Ir para Segunda Página"),
          ),
        ),
      ),
    );
  }
}
