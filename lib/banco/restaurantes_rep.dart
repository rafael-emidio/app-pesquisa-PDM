import '../models/restauranteModel.dart';

class RestaurantesRep {
  final List<RestauranteModel> _restaurantes = [];

  get restaurantes => this._restaurantes;

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
          'https://www.churrascarialugano.com.br/site/images/logo.png',
          'Churrascaria Lugano'),
      RestauranteModel(
          4,
          'https://www.bibasdelivery.com.br/admin/logo/file_5d01619e17641.jpg',
          'Bibas'),
    ]);
  }
}
