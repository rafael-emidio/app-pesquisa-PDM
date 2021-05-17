import 'dart:collection';

import 'package:app_pesquisa_pdm/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../models/restauranteModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'db_firestore.dart';

class RestaurantesRep extends ChangeNotifier {
  //lista de todos os restaurantes
  List<RestauranteModel> _restaurantes = [];

  UnmodifiableListView<RestauranteModel> get restaurantes =>
      UnmodifiableListView(_restaurantes);

  //lista de todos os restaurantes sem resposta
  List<RestauranteModel> _restaurantesSemResp = [];

  UnmodifiableListView<RestauranteModel> get restaurantesSemResp =>
      UnmodifiableListView(_restaurantesSemResp);

  //lista de todos os restaurantes com resposta
  List<RestauranteModel> _restaurantesComResp = [];

  UnmodifiableListView<RestauranteModel> get restaurantesComResp =>
      UnmodifiableListView(_restaurantesComResp);

  getRestaurantes() async {
    FirebaseFirestore db = await DBFirestore.get();
    var snapshot = await db.collection('restaurantes').get();

    snapshot.docs.forEach((doc) {
      final data = doc.data();
      _restaurantes.add(RestauranteModel(
        id: doc.id,
        email: data['email'],
        nome: data['nome'],
        proprietario: data['proprietario'],
        url: data['url'],
      ));
    });
    notifyListeners();
    return _restaurantes;
  }
  getRestaurantesSemResp() async {
    FirebaseFirestore db = await DBFirestore.get();
    var snapRest = await db.collection('restaurantes').get();

    snapRest.docs.forEach((doc) async {
      var snapPesq = await db.collection('pesquisas')
          .where('idRestaurante', isEqualTo: doc.id)
          .where('idUser', isEqualTo: AuthService.to.user.uid)
          .get();
      if(snapPesq.docs.length<=0){
        final data = doc.data();
        _restaurantesSemResp.add(RestauranteModel(
          id: doc.id,
          email: data['email'],
          nome: data['nome'],
          proprietario: data['proprietario'],
          url: data['url'],
        ));
      }
    });
    notifyListeners();
    return _restaurantesSemResp;
  }

  getRestaurantesComResp() async {
    FirebaseFirestore db = await DBFirestore.get();
    var snapRest = await db.collection('restaurantes').get();

    snapRest.docs.forEach((doc) async {
      var snapPesq = await db.collection('pesquisas')
          .where('idRestaurante', isEqualTo: doc.id)
          .where('idUser', isEqualTo: AuthService.to.user.uid)
          .get();
      if(snapPesq.docs.length>0){
        final data = doc.data();
        _restaurantesComResp.add(RestauranteModel(
          id: doc.id,
          email: data['email'],
          nome: data['nome'],
          proprietario: data['proprietario'],
          url: data['url'],
        ));
      }
    });
    notifyListeners();
    return _restaurantesComResp;
  }

  RestaurantesRep() {
    this.getRestaurantes();
    this.getRestaurantesSemResp();
    this.getRestaurantesComResp();
  }

}
