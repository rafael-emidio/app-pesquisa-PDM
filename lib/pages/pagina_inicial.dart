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

  salvarPesquisa(PesquisaModel pesquisa) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Obrigado por avaliar! sua resposta foi salva.',
            style: TextStyle(fontSize: 16))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pesquisa de satisfação'),
          leading: Icon(Icons.mood),
          actions: [
            IconButton(
                icon: Icon(Icons.star),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ScorePage()));
                })
          ],
        ),
        body: ListView.separated(
          itemCount: controller.restaurantes.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (BuildContext context, int i) {
            final List<RestauranteModel> lista = controller.restaurantes;
            return ListTile(
              leading: Image.network(lista[i].foto),
              title: Text(lista[i].nome),
              trailing: Text(lista[i].media.toString() == null
                  ? lista[i].media.toString()
                  : 'Sem média'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Pesquisa(
                          key: Key(lista[i].id.toString()),
                          restaurante: lista[i],
                          onSave: this.salvarPesquisa),
                    ));
              },
            );
          },
          padding: EdgeInsets.all(16),
        ));
  }
}
