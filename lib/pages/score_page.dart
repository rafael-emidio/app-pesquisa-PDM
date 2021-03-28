import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
                  padding: EdgeInsets.all(0),
                  child: Image.asset('assets/images/score.png'),
                ),
                Text(
                  'Seu score atual é de: Pontos aqui', //${widget.user.score}
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            Container(
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Opacity(
                            opacity: 0.25,
                            child: Image.asset(
                              'assets/images/score_5.png',
                              width: 250,
                            ),
                          ),
                          Text("100 Pontos",
                              style: TextStyle(
                                  fontSize: 24, color: Colors.red[700])),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Opacity(
                            opacity: 0.25,
                            child: Image.asset(
                              'assets/images/score_3.png',
                              width: 130,
                            ),
                          ),
                          Text("25 Pontos",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.red[700])),
                        ],
                      ),
                      Column(
                        children: [
                          Opacity(
                            opacity: 0.25,
                            child: Image.asset(
                              'assets/images/score_4.png',
                              width: 130,
                            ),
                          ),
                          Text("50 Pontos",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.red[700])),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Opacity(
                            opacity: 0.25,
                            child: Image.asset(
                              'assets/images/score_1.jpg',
                              width: 130,
                            ),
                          ),
                          Text("1 Ponto",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.red[700])),
                        ],
                      ),
                      Column(
                        children: [
                          Opacity(
                            opacity: 0.25,
                            child: Image.asset(
                              'assets/images/score_2.jpg',
                              width: 130,
                            ),
                          ),
                          Text("10 Pontos",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.red[700])),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
