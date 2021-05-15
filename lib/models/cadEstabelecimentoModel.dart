class CadEstabelecimentoModel {
  int id;
  String nome;
  String cnpj;
  String url;
  String email;
  String senha;

  CadEstabelecimentoModel(
      {this.id, this.nome, this.cnpj, this.url, this.email, this.senha});

  //apenas para printar, retirar depois
  String toString() {
    return "Nome do estabelecimento: " +
        this.nome +
        "\nCnpj: " +
        this.cnpj +
        "\nUrl da logo: " +
        this.url +
        "\nEmail: " +
        this.email +
        "\nSenha: " +
        this.senha;
  }
}