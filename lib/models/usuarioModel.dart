import 'dart:core';

class UsuarioModel {
  int id;
  String nome;
  String email;
  String senha;
  String confirmaSenha;

  UsuarioModel(this.nome, this.email, this.senha, this.confirmaSenha);
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

bool listUsuario(_email, _senha) {
  List<UsuarioModel> usuarios = List();
  usuarios.add(UsuarioModel('admin', 'admin@admin.com', '1234', '1234'));
  usuarios.add(UsuarioModel('teste1', 'teste1@teste1.com', '4321', '4321'));
  usuarios.add(UsuarioModel('thiago', 'thaigo@ads.com', '5678', '5678'));
  usuarios.add(UsuarioModel('rafael', 'rafael@ads.com', '8765', '8765'));
  usuarios.add(UsuarioModel('jhenyfer', 'jhenyfer@ads.com', '0987', '0987'));
  for (var i = 0; i < usuarios.length; i++) {
    if (_email == usuarios[i].email) {
      if (_senha == usuarios[i].senha) {
        return true;
      }
    }
  }
}
