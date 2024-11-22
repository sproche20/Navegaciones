import 'package:flutter/material.dart';

/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaginaUsuario(),
    );
  }
}*/

class PaginaUsuario extends StatelessWidget {
  const PaginaUsuario({Key? key}) : super(key: key);

  // Método que construye la tarjeta
  Widget _buildServiceCard(String nombre, String servicioTecnico, double precio, String estado) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.blue, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Columna 1 (75%)
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nombre, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text(servicioTecnico, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                // Línea azul separadora
                const VerticalDivider(color: Colors.blue, thickness: 2),
                // Columna 2 (25%)
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('\$$precio', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Línea azul larga debajo de la card
            Container(
              height: 3,
              color: Colors.blue,
            ),
            const SizedBox(height: 10),
            // Estado
            Center(
              child: Text(
                'Estado: $estado',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listado de Servicios',
          style: TextStyle(
            color: Colors.white,  // Cambia el color del texto a blanco
            fontWeight: FontWeight.bold,  // Hace el texto más grueso
            fontSize: 24,  // Tamaño del texto (opcional, ajusta según tu preferencia)
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título y línea azul debajo
            const Text(
              'Servicios Activos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            Container(
              height: 3,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            // Lista de tarjetas
            _buildServiceCard('Acer Aspire', 'Reparación de disco duro', 90.00, 'En Proceso'),
            const SizedBox(height: 20),
            _buildServiceCard('MacBook Pro', 'Reemplazo de batería', 150.00, 'En Proceso'),
            const SizedBox(height: 20),
            // Título y línea azul debajo para Servicios Finalizados
            const Text(
              'Servicios Finalizados',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            const SizedBox(height: 10),
            Container(
              height: 3,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            // Lista de tarjetas de servicios finalizados
                        _buildServiceCard('AsustuFaming', 'Formateo y limpieza', 55.00, 'Finalizado'),
            const SizedBox(height: 20),
            _buildServiceCard('HP Pavilion', 'Reemplazo de pantalla', 120.00, 'Finalizado'),
            const SizedBox(height: 20),
            _buildServiceCard('Dell Inspiron', 'Reparación de teclado', 80.00, 'Finalizado'),
            const SizedBox(height: 20),
            _buildServiceCard('Lenovo ThinkPad', 'Instalación de software', 40.00, 'Finalizado'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
