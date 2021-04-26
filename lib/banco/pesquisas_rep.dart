import '../models/pesquisaModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'db_firestore.dart';

class PesquisasRep {
  final List<PesquisaModel> _pesquisas = [];

  get pesquisas => this._pesquisas;

  FirebaseFirestore db = DBFirestore.get();

  PesquisasRep() {
    _pesquisas.addAll([
    ]);
  }
}