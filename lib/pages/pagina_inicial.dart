import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../banco/restaurantes_rep.dart';
import '../controllers/restaurante_controller.dart';
import '../models/restauranteModel.dart';
import '../models/pesquisaModel.dart';
import 'pesquisa.dart';
import 'score_page.dart';
import 'login.dart';
import '../services/auth_service.dart';

class PaginaInicial extends StatefulWidget {

  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  var controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    controller = RestauranteController();
  }

  // retorno do método onSave, volta para página inicial e mostra mensagem
  salvarPesquisa(PesquisaModel pesquisa) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Obrigado por avaliar! sua resposta foi salva.',
            style: TextStyle(fontSize: 16))));
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
    return Scaffold(
        appBar: AppBar(title: Text('Bem vindo a pesquisa')),
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
        body: Consumer<RestaurantesRep>(builder: (context, repositorio, child) {

          return ListView.separated(
            itemCount: repositorio.restaurantesSemResp.length,
            separatorBuilder: (_, __) => Divider(),
            itemBuilder: (BuildContext context, int i) {
              final List<RestauranteModel> lista =
                  repositorio.restaurantesSemResp; // lista de restaurantes
              return ListTile(
                leading: Image.network(
                  lista[i].url,
                  width: 65,
                ),
                title: Text(lista[i].nome),
                trailing: Text('Sem média'),
                //ao pressionar redireciona para a pagina de pesquisa referenciando o restaurante
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Pesquisa(
                            key: Key(lista[i]
                                .id
                                .toString()), //id do restaurante como chave
                            restaurante: lista[i], // restaurante em si
                            onSave: this
                                .salvarPesquisa // método onSave retorna para página inicial ao concluir pesquisa
                            ),
                      ));
                },
              );
            },
            padding: EdgeInsets.all(16),
          );
        }));
  }
}
