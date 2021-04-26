import 'package:app_pesquisa_pdm/services/auth_service.dart';
import 'package:flutter/material.dart';
import '../controllers/restaurante_controller.dart';
import '../models/restauranteModel.dart';

class ScorePage extends StatefulWidget {
  //User user;
  //ScorePage({Key key, this.user}) : super(key: key);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  var controller;

  @override
  void initState() {
    super.initState();
    controller = RestauranteController();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Pesquisa de satisfação"), //widget.user.nome
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_bar_chart),
                text: 'Pontos',
              ),
              Tab(
                icon: Icon(Icons.star_outlined),
                text: 'Descontos',
              ),
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
                  'Sua pontuação atual é 0', //${widget.user.score}
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            Container(
              child: ListView.separated(
                itemCount: controller.restaurantes.length,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (BuildContext context, int i) {
                  final List<RestauranteModel> lista =
                      controller.restaurantes; // lista de restaurantes
                  return ListTile(
                    leading: Image.network(
                      lista[i].url,
                      width: 65,
                    ),
                    title: Text(lista[i].nome),
                    trailing: Text(
                      '5%',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  );
                },
                padding: EdgeInsets.all(16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
