class UsuarioModel {
  int id;
  String nome;
  String email;
  String senha;
  String confirmaSenha;

  UsuarioModel(
      {this.id, this.nome, this.email, this.senha, this.confirmaSenha});

  //apenas para printar, retirar depois
  String toString() {
    return "Nome: " +
        this.nome +
        "\nEmail: " +
        this.email +
        "\nSenha: " +
        this.senha +
        "\nSenha confirmada: " +
        this.confirmaSenha;
  }
}
