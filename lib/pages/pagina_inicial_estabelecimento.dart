import 'package:app_pesquisa_pdm/banco/estab_rep.dart';
import 'package:app_pesquisa_pdm/controllers/estab_controller.dart';
import 'package:app_pesquisa_pdm/models/cupomModel.dart';
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
  // AuthService.to.logout();

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<PaginaIniciaEstabelecimento> {
  var controllerRestaurantes;

  @override
  void initState() {
    super.initState();
    controllerRestaurantes = RestauranteController();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Estabelecimento"), //widget.user.nome
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
                  icon: Icon(Icons.assessment_outlined),
                  text: 'Estatísticas',
                ),
                Tab(
                  icon: Icon(Icons.assignment_turned_in_outlined),
                  text: 'Cupons válidos',
                ),
              ],
            ),
          ),
          body:
          Consumer<RestaurantesRep>(builder: (context, repositorio, child) {
            return TabBarView(
              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Pesquisas respondidas: '+ repositorio.quantResp.toString(), //${widget.user.score}
                        style: TextStyle(
                            fontSize: 18,
                        ),
                        textAlign: TextAlign.right
                    ),
                    Text(
                      'Média de avaliações: ' + repositorio.mediaPesquisas.toString(), //${widget.user.score}
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Container(
                  child: ListView.separated(
                    itemCount: repositorio.cuponsRestaurante.length,
                    separatorBuilder: (_, __) => Divider(),
                    itemBuilder: (BuildContext context, int i) {
                      final List<CupomModel> lista =
                          repositorio.cuponsRestaurante; // lista de restaurantes
                      return ListTile(
                        title: Text(
                          lista[i].cupom,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          )
                        ),
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
                )
              ],
            );
          })),
    );
  }

  void _mostraAlert(idCupom) async{
      Alert(
        context: context,
        //type: AlertType.info,
        image: Image.asset(
          "assets/images/cupom.png",
          width: 170,
        ),
        title: "Validar Cupom",
        desc:
        "Deseja validar este cupom de desconto para o cliente ?",
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
              "VALIDAR",
              style: TextStyle(
                  color: Colors.white, fontSize: 18),
            ),
            onPressed: () {
              _excluirCupom(idCupom);
              Navigator.pop(context);
            },
            width: 120,
          )
        ],
      ).show();

  }
  void _excluirCupom(idCupom) async{
    AuthService.to.excluirCupom(idCupom);
  }
}