import 'package:flutter/material.dart';

import '../models/restauranteModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'db_firestore.dart';

class RestaurantesRep {
  List<RestauranteModel> _restaurantes = [];

  get restaurantes => this._restaurantes;


  getRestaurantes() async {
    FirebaseFirestore db = await DBFirestore.get();
    var snapshot = await db.collection('restaurantes').get();

    snapshot.docs.forEach((doc) {
      final data = doc.data();
      _restaurantes.add(
          RestauranteModel(
              id: doc.id,
              email: data['email'],
              nome: data['nome'],
              proprietario: data['proprietario'],
              url: data['url'],
          )
      );
    });
    return _restaurantes;
  }

  RestaurantesRep() {
    //_restaurantes.addAll([
    //  RestauranteModel(
    //    id: '1',
    //    email: 'Restaurante elite',
    //    nome: 'teste',
    //    proprietario: 'prop',
     //   url: 'https://restauranteelite.com.br/wp-content/uploads/2016/05/logoeliteblue.png',
     // ),
    //]);
    this.getRestaurantes();
  }
}