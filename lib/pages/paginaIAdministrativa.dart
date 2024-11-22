import 'package:flutter/material.dart';
import 'package:navegaciones/pages/servicioTecnico_Admin.dart';

class PaginaInicioA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Panel Administrativo',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false, // Centra el título
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20.0),
          color: Colors.white, // Fondo blanco
          elevation: 5.0, // Agrega una pequeña sombra
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), //Borde a las card
            side: const BorderSide(color: Colors.blue, width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Bienvenidos al panel administrativo',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Image.asset('assets/logo.png'), //Mostrar la imagen
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServicioTAdmin()),
                    );
                  },
                  icon: const Icon(Icons.add,
                      color: Colors.white), //Coloar ell icono
                  label: const Text('Insertar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Fondo azul
                    foregroundColor: Colors.white, // Texto blanco
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
