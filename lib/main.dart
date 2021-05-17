import 'package:app_pesquisa_pdm/services/FbService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import './services/auth_service.dart';
import './pages/pagina_inicial.dart';
import './pages/login.dart';
import './pages/checkauth.dart';
import 'banco/estab_rep.dart';
import 'banco/restaurantes_rep.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.lazyPut<AuthService>(() => AuthService());

  runApp(
      ChangeNotifierProvider(
          create: (context) => RestaurantesRep(),
          child: AppPesquisa()
      )
  );
}

class AppPesquisa extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pesquisas de Satisfação',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      ),
      home: CheckAuth(),
    );
  }
}
