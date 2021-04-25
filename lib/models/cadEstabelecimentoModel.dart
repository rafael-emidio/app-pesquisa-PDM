class CadEstabelecimentoModel {
  int id;
  String nome;
  String cnpj;
  String url;
  String email;

  CadEstabelecimentoModel(
      {this.id, this.nome, this.cnpj, this.url, this.email});

  //apenas para printar, retirar depois
  String toString() {
    return "Nome do estabelecimento: " +
        this.nome +
        "\nCnpj: " +
        this.cnpj +
        "\nUrl da logo: " +
        this.url +
        "\nEmail: " +
        this.email;
  }
}
