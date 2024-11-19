import 'package:flutter/material.dart';

class Contactos extends StatelessWidget {
  const Contactos({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContactosForm(); // Llamamos a ContactosForm en lugar de toda la clase
  }
}

class ContactosForm extends StatefulWidget {
  const ContactosForm({Key? key}) : super(key: key);

  @override
  State<ContactosForm> createState() => _ContactosFormState();
}

class _ContactosFormState extends State<ContactosForm> {
  final _formKey = GlobalKey<FormState>(); // Clave para el formulario
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _opinionController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _opinionController.dispose();
    super.dispose();
  }

  void _enviar() {
    if (_formKey.currentState!.validate()) {
      // Si el formulario es válido, muestra el diálogo de éxito
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Formulario Enviado'),
          content: const Text('Gracias por tu opinión!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _nombreController.clear(); // Limpia el campo Nombre
              _opinionController.clear(); //Limpia el campor opinion
              },
              child: const Text('Cerrar'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Primera Card con información de contacto
                Card(
                  elevation: 8, // Dar un efecto de sombra
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Color(0xFF0076bc), // Color del borde azul
                      width: 2, // Ancho del borde
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/equipo.jpg', // Imagen de equipo
                            height: 150, // Altura de la imagen
                            width: double.infinity, // Ancho que cubre todo
                            fit: BoxFit.cover, // Ajustar a la caja
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Contáctanos',
                          style: TextStyle(
                            fontSize: 24, // Tamaño de fuente
                            fontWeight: FontWeight.bold, // Negrita
                            color: Color(0xFF0076bc),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Estamos aquí para ayudarte',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          children: [
                            Icon(Icons.phone, color: Color(0xFF0076bc)), // Icono de teléfono
                            SizedBox(width: 8),
                            Text('Teléfono: +593 979274126'), // Número de teléfono
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Icon(Icons.email, color: Color(0xFF0076bc)), // Icono de email
                            SizedBox(width: 8),
                            Text('Email: atencionCliente@softech.com'), // Email
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFF0076bc)), // Icono de dirección
                            SizedBox(width: 8),
                            Text('Dirección: Serrano y Luis Cordero, Azogues'), // Dirección
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Espacio entre las dos Cards

                // Segunda Card con el formulario
                Card(
                  elevation: 8, // Dar un efecto de sombra
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Color(0xFF0076bc), // Color del borde azul
                      width: 2, // Ancho del borde
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey, // Asignamos la clave al formulario
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Tu Opinión es Importante',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0076bc),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _nombreController,
                            decoration: const InputDecoration(
                              labelText: 'Nombre',
                              border: OutlineInputBorder(),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa tu nombre'; // Mensaje de error
                              }
                              return null; // Si todo está bien, no retorna nada
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: _opinionController,
                            decoration: const InputDecoration(
                              labelText: 'Opinión',
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 3, // Permite varias líneas para la opinión
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa tu opinión'; // Mensaje de error
                              }
                              return null; // Si todo está bien, no retorna nada
                            },
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: ElevatedButton(
                              onPressed: _enviar, // Llama a la función _enviar
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF0076bc), // Color del botón
                              ),
                              child: const Text(
                                'Enviar',
                                style: TextStyle(color: Colors.white), // Cambiar el color del texto a blanco
                              ),
                            ),
                          ),
                        ],
                      ),
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
