import 'package:flutter/material.dart';
import './pages/pagina_inicial.dart';

void main() {
  runApp(AppPesquisa());
}

class AppPesquisa extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pesquisas de Satisfação',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      home: PaginaInicial(),
    );
  }
}
