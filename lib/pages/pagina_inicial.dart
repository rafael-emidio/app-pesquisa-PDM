import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../controllers/restaurante_controller.dart';
import '../models/restauranteModel.dart';
import '../models/pesquisaModel.dart';
import 'pesquisa.dart';
import 'score_page.dart';

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
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Obrigado por avaliar! sua resposta será salva.',
              style: TextStyle(fontSize: 16)
          )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pesquisa de satisfação'),
          actions: [
            IconButton(
                icon: Icon(Icons.star),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ScorePage() // redireciona para página de pontuação do usuário
                      )
                  );
                })
          ],
        ),
        body: ListView.separated(
          itemCount: controller.restaurantes.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (BuildContext context, int i) {
            final List<RestauranteModel> lista = controller.restaurantes; // lista de restaurantes
            return ListTile(
              leading: Image.network(
                lista[i].foto,
                width: 65,
              ),
              title: Text(lista[i].nome),
              trailing: Text(
                // se não houver média escreve "sem média"
                  lista[i].media.toString() == null
                  ? lista[i].media.toString()
                  : 'Sem média'
              ),
              //ao pressionar redireciona para a pagina de pesquisa referenciando o restaurante
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Pesquisa(
                          key: Key(lista[i].id.toString()), //id do restaurante como chave
                          restaurante: lista[i], // restaurante em si
                          onSave: this.salvarPesquisa // método onSave retorna para página inicial ao concluir pesquisa
                      ),
                    ));
              },
            );
          },
          padding: EdgeInsets.all(16),
        )
    );
  }
}
