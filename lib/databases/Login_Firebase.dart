
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navegaciones/pages/inicio.dart';
import 'package:navegaciones/pages/paginaIAdministrativa.dart';
import 'package:navegaciones/pages/servicioTecnico_Admin.dart';
import 'package:navegaciones/pages/usuario.dart';

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

  Future<void> loginUsuario(String email, String password, BuildContext context) async {
  try {
    // Intentar iniciar sesión
    await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    print('Usuario logeado');

    // Si la autenticación es exitosa, muestra un mensaje de éxito
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Inicio de sesión exitoso'),
        content: const Text('Bienvenido!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();  // Cierra el diálogo
              // Redirige a la página de inicio o cualquier otra página después del login
               if (email == 'softech@gmail.com') {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  PaginaInicioA()),
              );
               }else{
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaginaUsuario()),
              );
               }
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  } on FirebaseAuthException catch (e) {
    // Manejo de errores de autenticación específicos
    String errorMessage = 'Ocurrió un error al iniciar sesión';

    // Verifica el código de error y proporciona mensajes específicos
    if (e.code == 'user-not-found') {
      errorMessage = 'No hay un usuario registrado con este correo electrónico';
    } else if (e.code == 'wrong-password') {
      errorMessage = 'La contraseña ingresada es incorrecta';
    } else if (e.code == 'invalid-email') {
      errorMessage = 'El correo electrónico ingresado no es válido';
    } else if (e.code == 'invalid-credential') {
      errorMessage = 'Las credenciales proporcionadas son incorrectas o han expirado';
    } else {
      errorMessage = 'Error desconocido: ${e.message}';
    }

    print("Error al ingresar: ${e.toString()}");

    // Si ocurre un error, muestra un mensaje de error con el error específico
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error de inicio de sesión'),
        content: Text(errorMessage),  // Mensaje de error específico
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();  // Cierra el diálogo
            },
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }
}




}
