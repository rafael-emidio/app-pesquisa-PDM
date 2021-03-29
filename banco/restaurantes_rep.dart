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
          'https://static.wixstatic.com/media/bf9bf7_d71a2d889f7f48548d6154eb980d638f~mv2.png/v1/fill/w_239,h_104,al_c,q_85,usm_0.66_1.00_0.01/Adobe_20190830_110758.webp',
          'Espeto D Ponta'),
      RestauranteModel(
          4,
          'https://www.bibasdelivery.com.br/admin/logo/file_5d01619e17641.jpg',
          'Bibas'),
    ]);
  }
}
