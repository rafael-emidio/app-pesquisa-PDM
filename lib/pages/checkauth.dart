import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import '../services/auth_service.dart';
import '../pages/pagina_inicial.dart';
import '../pages/pagina_inicial_estabelecimento.dart';
import '../pages/login.dart';

class CheckAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Obx(
          () => AuthService.to.usuarioAutenticado.value
          ? AuthService.to.usuarioRest.value
              ? PaginaIniciaEstabelecimento()
              : PaginaInicial()
          : LoginPage(),
    );
  }
}