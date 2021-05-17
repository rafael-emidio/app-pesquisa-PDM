import 'package:app_pesquisa_pdm/banco/estab_rep.dart';

import '../models/restauranteModel.dart';
import '../models/cupomModel.dart';
import '../banco/restaurantes_rep.dart';

class EstabController{

  EstabRep estabRep;
  List<CupomModel> get cupons => estabRep.cuponsRestaurante;

  EstabController(){
    estabRep = EstabRep();
  }
}