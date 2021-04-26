import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>(null);
  var usuarioAutenticado = false.obs;

  @override
  void onInit(){
    super.onInit();

    _firebaseUser.bindStream(_auth.authStateChanges());
    ever(_firebaseUser, (User user){
      if(user != null){
        usuarioAutenticado.value = true;
      } else{
        usuarioAutenticado.value = false;
      }
    });

  }

  User get user => _firebaseUser.value;
  static AuthService get to => Get.find<AuthService>();

  showSnack(String titulo, String erro){
    Get.snackbar(
      titulo,
      erro,
      backgroundColor: Colors.grey[900],
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  criarUsuario(String email, String password) async{
      try{
        await _auth.createUserWithEmailAndPassword(email: email, password: password);
      } catch(e){
        showSnack('Erro ao registrar usuário', e.message);
      }
  }

  login(String email, String password) async{
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch(e){
      showSnack('Erro no login', e.message);
    }
  }

  logout() async{
    try{
      await _auth.signOut();
    } catch(e){
      showSnack('Erro ao sair', e.message);
    }
  }

}