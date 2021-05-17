import 'package:app_pesquisa_pdm/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../banco/restaurantes_rep.dart';
import '../controllers/restaurante_controller.dart';
import '../models/restauranteModel.dart';
import 'score_page.dart';

class PaginaIniciaEstabelecimento extends StatefulWidget {
  //User user;
  //ScorePage({Key key, this.user}) : super(key: key);

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<PaginaIniciaEstabelecimento> {
  var controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = RestauranteController();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
      if (_selectedIndex == 0) {
      } else if (_selectedIndex == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    ScorePage() // redireciona para página de pontuação do usuário
            ));
      } else if (_selectedIndex == 2) {
        AuthService.to.logout();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Controle do estabelecimento"), //widget.user.nome
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.assessment_outlined),
                  text: 'Média do seu estabelecimento',
                ),
                Tab(
                  icon: Icon(Icons.assignment_turned_in_outlined),
                  text: 'Cupons válidos',
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Pagina inicial",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Pontuação",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: "logout",
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
          body:
          Consumer<RestaurantesRep>(builder: (context, repositorio, child) {
            return TabBarView(
              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Pesquisas respondidas: ', //${widget.user.score}
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.right),
                    Text(
                      'Média de avaliações: ', //${widget.user.score}
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Container(
                  child: ListView.separated(
                    itemCount: repositorio.restaurantes.length,
                    separatorBuilder: (_, __) => Divider(),
                    itemBuilder: (BuildContext context, int i) {
                      final List<RestauranteModel> lista =
                          repositorio.restaurantes; // lista de restaurantes
                      return;
                    },
                    padding: EdgeInsets.all(16),
                  ),
                )
              ],
            );
          })),
    );
  }
}
