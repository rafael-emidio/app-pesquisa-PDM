import '../models/restauranteModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'db_firestore.dart';

class RestaurantesRep {
  final List<RestauranteModel> _restaurantes = [];

  get restaurantes => this._restaurantes;

  FirebaseFirestore db = DBFirestore.get();

  RestaurantesRep() {
    _restaurantes.addAll([
      RestauranteModel(
          1,
          'https://restauranteelite.com.br/wp-content/uploads/2016/05/logoeliteblue.png',
          'Restaurante Elite'),
      RestauranteModel(
          2,
          'https://chiquinho.com.br/static/media/logo-chq-250-250.5e86ef55.png',
          'Chiquinho sorvetes'),
      RestauranteModel(
          3,
          'https://d25dk4h1q4vl9b.cloudfront.net/bundles/front/media/images/header/mcdonalds-logo.png',
          'McDonalds'),
      RestauranteModel(
          4,
          'https://finistore.vteximg.com.br/arquivos/ids/160931/new-logo.png?v=637413261489530000',
          'Fini'),
    ]);
  }
}