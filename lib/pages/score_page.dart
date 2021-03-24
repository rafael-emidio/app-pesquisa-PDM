import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  //User user;
  //ScorePage({Key key, this.user}) : super(key: key);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => print('Tela de configurações (se tiver)'),
            ),
          ],
          title: Text("Nome aqui"), //widget.user.nome
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_bar_chart),
                text: 'Pontos',
              ),
              Tab(
                icon: Icon(Icons.star_outlined),
                text: 'Conquistas',
              ),
              /*Tab(
                icon: Icon(Icons.star_outlined),
                text: 'Histórico',
              )*/
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Image.network(
                      'https://www.kindpng.com/picc/m/8-80851_chef-png-png-gorro-de-cocinero-png-transparent.png'),
                ),
                Text(
                  'Seu score atual é de: Pontos aqui', //${widget.user.score}
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}
