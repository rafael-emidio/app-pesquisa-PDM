import 'dart:io';
import 'package:app_pesquisa_pdm/banco/estab_rep.dart';
import 'package:app_pesquisa_pdm/banco/restaurantes_rep.dart';
import 'package:app_pesquisa_pdm/models/pesquisaModel.dart';
import 'package:flutter/cupertino.dart';

import '../models/cadEstabelecimentoModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../banco/db_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as fb_storage;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get/get.dart';

class AuthService extends GetxController{
  CadEstabelecimentoModel novoEstabelecimento;
  FirebaseAuth _auth = FirebaseAuth.instance;
  fb_storage.FirebaseStorage _storage = fb_storage.FirebaseStorage.instance;

  Rx<User> _firebaseUser = Rx<User>(null);
  var usuarioAutenticado = false.obs;
  var usuarioRest = false.obs;
  String nomeUser;

  @override
  void onInit(){
    super.onInit();

    _firebaseUser.bindStream(_auth.authStateChanges());
    ever(_firebaseUser, (User user) async{
      if(user != null){
        FirebaseFirestore db = await DBFirestore.get();
        var snapshot = await db.collection('clientes').where('idAuth', isEqualTo: user.uid).get();
        if(snapshot.docs.length <= 0){
          usuarioRest.value = true;
        }
        usuarioAutenticado.value = true;
      } else{
        usuarioAutenticado.value = false;
        usuarioRest.value = false;
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

  criarUsuario(String email, String password, String nome) async{
      FirebaseFirestore db = await DBFirestore.get();
      try{
        await _auth.createUserWithEmailAndPassword(email: email, password: password)
            .then((cad) =>

                db.collection('clientes').add({
                  'idAuth': cad.user.uid,
                  'email': email,
                  'nome': nome
                })

                );
      } catch(e){
        showSnack('Erro ao registrar usuário', e.message);
      }
  }

  criarEstabelecimento(CadEstabelecimentoModel estab, File img) async{
    FirebaseFirestore db = await DBFirestore.get();
    
    fb_storage.Reference ref = _storage.ref()
                                .child('images')
                                .child("estab"+DateTime.now().toString());

    String url;
    String authId;
    try{
      await _auth.createUserWithEmailAndPassword(email: estab.email, password: estab.senha)
          .then((cad) =>
              authId = cad.user.uid
           );
      fb_storage.UploadTask uploadTask = ref.putFile(img);
      var imageUrl = await (await uploadTask).ref.getDownloadURL();
      url = imageUrl;
      db.collection('restaurantes').add({
        'idAuth': authId,
        'nome': estab.nome,
        'email': estab.email,
        'cnpj': estab.cnpj,
        'url': url
      });
    } catch(e){
      showSnack('Erro ao registrar estabelecimento', e.message);
    }
  }

  cadastrarPesquisa(PesquisaModel pesquisa) async{
    FirebaseFirestore db = await DBFirestore.get();
    try{
      db.collection('pesquisas').add({
          'idRestaurante': pesquisa.idrestaurante,
          'idUser': pesquisa.iduser,
          'r1': pesquisa.r1,
          'r2': pesquisa.r2,
          'r3': pesquisa.r3,
          'r4': pesquisa.r4,
          'r5': pesquisa.r5,
          'comentario': pesquisa.comentario
        }
      );
    } catch(e){
      showSnack('Erro ao registrar pesquisa', e.message);
    }
  }

  Future<String> buscarCupom(String idrest) async{
    String cupom = "";
    FirebaseFirestore db = await DBFirestore.get();
    try{
      var snapshot = await db.collection('cupons')
          .where('idRestaurante', isEqualTo: idrest)
          .where('idUser', isEqualTo: AuthService.to.user.uid)
          .get();
      snapshot.docs.forEach((doc) async {
          final data = doc.data();
          cupom = data['cupom'];
      });
      return cupom;
    } catch(e){
      showSnack('Erro ao buscar cupom', e.message);
    }
    return cupom;
  }
  gravarCupom(idrest, cupom) async{
    FirebaseFirestore db = await DBFirestore.get();
    try{
      db.collection('cupons').add({
        'idRestaurante': idrest,
        'idUser': user.uid,
        'cupom': cupom
      }
      );
    } catch(e){
      showSnack('Erro ao registrar cupom', e.message);
    }
  }
  excluirCupom(idcupom) async{
    FirebaseFirestore db = await DBFirestore.get();
    try{
      db.collection('cupons')..doc(idcupom).delete();
    } catch(e){
      showSnack('Erro ao excluir cupom', e.message);
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