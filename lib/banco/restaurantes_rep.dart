import 'dart:collection';

import 'package:app_pesquisa_pdm/models/cupomModel.dart';
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

  //lista de todos os cupons cadastrados
  List<CupomModel> _cuponsRestaurante = [];

  UnmodifiableListView<CupomModel> get cuponsRestaurante =>
      UnmodifiableListView(_cuponsRestaurante);

  //lista de todos os cupons cadastrados
  double _mediaPesquisas = 0;

  double get mediaPesquisas => _mediaPesquisas;

  //lista de todos os cupons cadastrados
  int _quantResp = 0;

  int get quantResp => _quantResp;

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

  getCuponsRest() async {
    FirebaseFirestore db = await DBFirestore.get();
    var snapRest = await db.collection('restaurantes')
        .where('idAuth', isEqualTo: AuthService.to.user.uid)
        .get();

    snapRest.docs.forEach((doc) async {
      var snapCupom = await db.collection('cupons')
          .where('idRestaurante', isEqualTo: doc.id)
          .get();
      snapCupom.docs.forEach((element) {
        final data = element.data();
        _cuponsRestaurante.add(CupomModel(
            element.id,
            data['idRestaurante'],
            data['idUser'],
            data['cupom']
        )
        );
      });
    });
    notifyListeners();
    return _cuponsRestaurante;
  }

  getQuantRespondidas() async {
    FirebaseFirestore db = await DBFirestore.get();
    var snapRest = await db.collection('restaurantes')
        .where('idAuth', isEqualTo: AuthService.to.user.uid)
        .get();

    snapRest.docs.forEach((doc) async {
      var snapCupom = await db.collection('pesquisas')
          .where('idRestaurante', isEqualTo: doc.id)
          .get();
      _quantResp = snapCupom.docs.length;
      });
    notifyListeners();
    return _quantResp;
  }

  getMediaPesquisas() async {
    FirebaseFirestore db = await DBFirestore.get();
    double soma = 0;
    var snapRest = await db.collection('restaurantes')
        .where('idAuth', isEqualTo: AuthService.to.user.uid)
        .get();

    snapRest.docs.forEach((doc) async {
      var snapCupom = await db.collection('pesquisas')
          .where('idRestaurante', isEqualTo: doc.id)
          .get();
      snapCupom.docs.forEach((element) {
        final data = element.data();
        soma += (
            double.tryParse(data['r1'].toString())
                +double.tryParse(data['r2'].toString())
                +double.tryParse(data['r3'].toString())
                +double.tryParse(data['r4'].toString())
                +double.tryParse(data['r5'].toString()))/5;
      });
      _mediaPesquisas = soma/snapCupom.docs.length;
    });
    notifyListeners();
    return _mediaPesquisas;
  }



  RestaurantesRep() {
    this.getRestaurantes();
    this.getRestaurantesSemResp();
    this.getRestaurantesComResp();
    if(AuthService.to.usuarioRest.value){
      this.getCuponsRest();
      this.getMediaPesquisas();
      this.getQuantRespondidas();
    }

  }

}
