
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login {  
  final FirebaseAuth _auth = FirebaseAuth.instance;
 
  Future<void> registrarUsuario(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      print("Usuario registrado exitosamente");
    } catch (e) {
      print("Error al registrar: ${e.toString()}");
    }
  }

  Future<void> loginUsuario(BuildContext context,String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    print('Usuario logeado');
    } catch (e) {
      print("Error al registrar: ${e.toString()}");
    }
  }



}
