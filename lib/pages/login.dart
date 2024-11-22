import 'dart:math';

import 'package:flutter/material.dart';
import 'package:navegaciones/databases/Login_Firebase.dart';
import 'package:navegaciones/pages/inicio.dart';
import 'package:navegaciones/pages/servicioTecnico_Admin.dart';
import 'package:navegaciones/pages/usuario.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Login _loginFirebase = Login();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _claveController = TextEditingController();

  void _loginUsuario() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Esperar el login
      await _loginFirebase.loginUsuario(
         _emailController.text,
        _claveController.text,
         context,
      );
    }
  }
      // Mostrar un diálogo de confirmación
      

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView( // Asegura que la Card sea desplazable si el contenido es largo
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 3), // Borde azul de 3px
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.all(20.0),
                width: double.infinity, // Esto hace que el ancho de la Card ocupe todo el espacio disponible
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // Ajusta la altura según el contenido
                    children: [
                      // Imagen en la parte superior
                      Image.asset(
                        'assets/logo.png', // Asegúrate de tener la imagen en assets
                        height: 100,
                      ),
                      SizedBox(height: 10),

                      // Texto de "Iniciar Sesión"
                      const Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Campo de Email con icono
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(Icons.email, color: Colors.blue), // Icono dentro del campo
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue, width: 1),
                          ),
                          labelStyle: TextStyle(color: Colors.blue), // Color del label en azul
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su correo electrónico';
                          }
                          if (!RegExp(r"^[a-zA-Z0-9]+@[a-zAZ0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                            return 'Por favor ingrese un correo electrónico válido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),

                      // Campo de Contraseña con icono
                      TextFormField(
                        controller: _claveController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          prefixIcon: Icon(Icons.lock, color: Colors.blue), // Icono dentro del campo
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue, width: 1),
                          ),
                          labelStyle: TextStyle(color: Colors.blue), // Color del label en azul
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su contraseña';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Botón de Iniciar sesión con icono
                      ElevatedButton.icon(
                        onPressed: _loginUsuario,
                        icon: const Icon(Icons.login, color: Colors.white),
                        label: const Text(
                          'Iniciar sesión',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
