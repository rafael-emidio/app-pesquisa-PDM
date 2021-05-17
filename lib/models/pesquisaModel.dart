class PesquisaModel {
  String id;
  String iduser;
  String idrestaurante;
  int r1;
  int r2;
  int r3;
  int r4;
  int r5;
  String comentario;

  PesquisaModel(this.iduser, this.idrestaurante, this.r1, this.r2, this.r3, this.r4, this.r5, this.comentario);
  String toString() {
    return "{"+this.iduser+", "+this.idrestaurante+","+ this.r1.toString()+"," +this.r2.toString()+","+ this.r3.toString()+","+ this.r4.toString()+"," +this.r5.toString()+","+ this.comentario+"}";
  }
}