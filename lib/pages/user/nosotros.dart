import 'package:flutter/material.dart';

class nosotros extends StatelessWidget {
  const nosotros({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(
            255, 255, 255, 255), // Fondo de color azul claro
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen de encabezado
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/banner.png', // Reemplaza con tu imagen
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Título de la misión
                const Text(
                  'Nuestra Misión',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0076bc)),
                ),
                const SizedBox(height: 10),
                // Texto de la misión
                const Text(
                  'Brindamos un servicio técnico de alta calidad con atención personalizada y a domicilio, '
                  'garantizando la satisfacción del cliente. Ofrecemos los mejores productos del mercado '
                  'a precios competitivos y mantenemos un seguimiento constante del estado de reparación de los equipos.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                // Título de la visión
                const Text(
                  'Nuestra Visión',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0076bc)),
                ),
                const SizedBox(height: 10),
                // Texto de la visión
                const Text(
                  'Ser la empresa líder en servicios técnicos, reconocida por nuestro compromiso con la '
                  'excelencia y la atención personalizada. Queremos ser el aliado confiable de nuestros clientes, '
                  'ayudándoles a resolver sus problemas técnicos y asegurando que tengan acceso a la información '
                  'sobre el estado de sus reparaciones.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Equipo de Trabajo',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0076bc)),
                ),
                const SizedBox(height: 20), //Agregar espacio
                // Imagen de servicio
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/equipo.jpg', // Reemplaza con tu imagen
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
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
