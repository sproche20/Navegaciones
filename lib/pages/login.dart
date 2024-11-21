import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
 
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Bordes redondeados
              side: BorderSide(color: Colors.blue, width: 2), // Borde azul
            ),
            elevation: 5,
            color: Colors.white, // Fondo blanco de la Card
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Imagen en la parte superior
                  Image.asset('assets/users.png', height: 100), // Asegúrate de tener una imagen en esta ruta

                  const SizedBox(height: 20),

                  // Texto "Iniciar sesión"
                  const Text(
                    'Iniciar sesión',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Campo de texto para el correo electrónico
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Correo electrónico',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Campo de texto para la contraseña
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Contraseña',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Botón de Iniciar sesión con icono
                  ElevatedButton.icon(
                    onPressed: () {
                      // Lógica de login aquí
                    },
                    icon: Icon(Icons.login,color: Colors.white,),
                    label: Text('Iniciar sesión',style: TextStyle(
                    color: Colors.white, // Color del texto
                    ),),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ), backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20), // Color de fondo del botón
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
