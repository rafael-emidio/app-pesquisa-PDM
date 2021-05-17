import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Text('Bem vindo a Pesquisas'),
              actions: [
                IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      AuthService.to.logout();
                    }),
              ],
              bottom: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                    text: 'Página inicial',
                  ),
                  Tab(
                    icon: Icon(Icons.star),
                    text: 'Descontos',
                  ),
                ],
              ),
            ),
            body: Consumer<RestaurantesRep>(
                builder: (context, repositorio, child) {
                  return TabBarView(children: [
                  ListView.separated(
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
                  ),
                    ListView.separated(
                      itemCount: repositorio.restaurantesComResp.length,
                      separatorBuilder: (_, __) => Divider(),
                      itemBuilder: (BuildContext context, int i) {
                        final List<RestauranteModel> lista =
                            repositorio.restaurantesComResp; // lista de restaurantes
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
                          //ao pressionar redireciona para a pagina de pesquisa referenciando o restaurante
                          onTap: () {
                            _mostraAlert(lista[i].id);
                          },
                        );
                      },
                      padding: EdgeInsets.all(16),
                    ),
                  ]);
                }
                )
        )
    );
  }
  void _mostraAlert(idRest) async{
    var cupom = await AuthService.to.buscarCupom(idRest);
    print(cupom);
    if(cupom == null || cupom == ""){
      Alert(
        context: context,
        //type: AlertType.info,
        image: Image.asset(
          "assets/images/cupom.png",
          width: 170,
        ),
        title: "Resgate de Cupom",
        desc:
        "Deseja resgatar um cupom de desconto para este estabelecimento ?",
        buttons: [
          DialogButton(
            child: Text(
              "RETORNAR",
              style: TextStyle(
                  color: Colors.white, fontSize: 18),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          ),
          DialogButton(
            child: Text(
              "RESGATAR",
              style: TextStyle(
                  color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              var cupom = randomNumeric(6);
              _gravarCupom(idRest, cupom);
              Alert(
                context: context,
                title: "CUPOM",
                content: Column(
                  children: <Widget>[
                    Text(cupom),
                  ],
                ),
                buttons: [
                  DialogButton(
                    child: Text(
                      "RETORNAR",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20),
                    ),
                    onPressed: () => {
                      Navigator.pop(context),
                      Navigator.pop(context)
                    },
                    width: 120,
                  )
                ],
              ).show();
            },
            width: 120,
          )
        ],
      ).show();
    }else{
      Alert(
        context: context,
        title: "CUPOM",
        content: Column(
          children: <Widget>[
            Text(cupom),
          ],
        ),
        buttons: [
          DialogButton(
            child: Text(
              "RETORNAR",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }

  }

  void _gravarCupom(idRest, cupom) async{
    AuthService.to.gravarCupom(idRest, cupom);
  }
}
