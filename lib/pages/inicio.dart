import 'package:flutter/material.dart';
import 'package:navegaciones/pages/programas.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  int? selectedIndex; // Índice de la tarjeta seleccionada

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(
            255, 255, 255, 255), // Color blanco para el body
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Banner con imagen de bordes redondeados
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/banner.png',
                  ),
                ),
              ),
              // Espacio entre banner y título
              const SizedBox(height: 20),
              // Título
              const Text(
                'Ofrecemos los siguientes servicios:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0076bc), // Color del texto
                ),
              ),
              // Espacio entre título y tarjetas
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    // Fila 1 de tarjetas
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //llamamos a la funcion y le pasamos los parametros correspondientes
                        _disenoCard(0, Icons.computer, 'Formateo de Equipos'),
                        _disenoCard(1, Icons.phone_iphone, 'Asistencia Remota'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Fila 2 de tarjetas
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _disenoCard1(
                            2, Icons.build, 'Reparación de\nComponentes'),
                        _disenoCard(3, Icons.tv, 'Instalación de\nProgramas'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Fila 3 de tarjetas
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _disenoCard(
                            4, Icons.report_problem, 'Diagnóstico de Fallas'),
                        _disenoCard(
                          5,
                          Icons.bug_report,
                          'Eliminación de Virus',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//Creamos una funcoones para el diseño de las card
  Widget _disenoCard(int index, IconData icon, String descrpcion) {
    bool isSelected =
        selectedIndex == index; // Verifica si esta tarjeta está seleccionada
    return GestureDetector(
      //Detector de gestos
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Programas(categoria: 'programas')));
        //Metodo que se ejecuta cuando se toca la tarjeta
        setState(() {
          selectedIndex = isSelected ? null : index; // Cambia la selección
        });
      },
      child: SizedBox(
        width: 180, // Establece el ancho de la tarjeta
        child: Card(
          color: Colors.white, // Color de fondo blanco
          elevation: 4,
          shape: RoundedRectangleBorder(
            //definir la forma de la tarjeta
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              //Este permite cambiar el color de la tarjeta si esta o no seleccionada
              color: isSelected
                  ? Colors.blue
                  : const Color(0xFF00e2d4), // Color del borde
              width: 3,
            ),
          ),
          child: Padding(
            //Allande un espacio al contenido dentro de la tarjeta
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centra el contenido verticalmente
              children: [
                Icon(
                  icon,
                  size: 60,
                  color: isSelected
                      ? Colors.blue
                      : const Color(0xFF00e2d4), // Color del ícono
                ),
                const SizedBox(height: 10),
                Text(descrpcion, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _disenoCard1(int index, IconData icon, String descrpcion) {
    bool isSelected =
        selectedIndex == index; // Verifica si esta tarjeta está seleccionada
    return GestureDetector(
      //Detector de gestos
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Programas(categoria: 'componentes')));
        //Metodo que se ejecuta cuando se toca la tarjeta
        setState(() {
          selectedIndex = isSelected ? null : index; // Cambia la selección
        });
      },
      child: SizedBox(
        width: 180, // Establece el ancho de la tarjeta
        child: Card(
          color: Colors.white, // Color de fondo blanco
          elevation: 4,
          shape: RoundedRectangleBorder(
            //definir la forma de la tarjeta
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              //Este permite cambiar el color de la tarjeta si esta o no seleccionada
              color: isSelected
                  ? Colors.blue
                  : const Color(0xFF00e2d4), // Color del borde
              width: 3,
            ),
          ),
          child: Padding(
            //Allande un espacio al contenido dentro de la tarjeta
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Centra el contenido verticalmente
              children: [
                Icon(
                  icon,
                  size: 60,
                  color: isSelected
                      ? Colors.blue
                      : const Color(0xFF00e2d4), // Color del ícono
                ),
                const SizedBox(height: 10),
                Text(descrpcion, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
