import '../models/restauranteModel.dart';
import '../banco/restaurantes_rep.dart';

class RestauranteController{

  RestaurantesRep restaurantesRep;
  List<RestauranteModel> get restaurantes => restaurantesRep.restaurantes;

  RestauranteController(){
    restaurantesRep = RestaurantesRep();
  }
}