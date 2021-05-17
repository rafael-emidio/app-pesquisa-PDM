import 'dart:collection';

import 'package:app_pesquisa_pdm/models/cupomModel.dart';
import 'package:app_pesquisa_pdm/services/auth_service.dart';
import 'package:flutter/material.dart';

import '../models/restauranteModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'db_firestore.dart';

class EstabRep extends ChangeNotifier {
  //lista de todos os cupons cadastrados
  List<CupomModel> _cuponsRestaurante = [];
  UnmodifiableListView<CupomModel> get cuponsRestaurante =>
      UnmodifiableListView(_cuponsRestaurante);

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


  EstabRep() {
    this.getCuponsRest();
  }

}
