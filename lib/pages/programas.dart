import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navegaciones/databases/databaseDao.dart';
import 'package:navegaciones/extensions/string_extensions.dart';
import 'package:navegaciones/models/appsModels.dart';

class Programas extends StatefulWidget {
  final String categoria;

  const Programas({Key? key, required this.categoria}) : super(key: key);

  @override
  State<Programas> createState() => _ProgramasState();
}

class _ProgramasState extends State<Programas> {
  bool isMoved = false;
  List<Appsmodels> apps = [];
  final dao = DatabaseDao();

  @override
  void initState() {
    super.initState();
    _loadApps();
  }

  Future<void> _loadApps() async {
    final listApps = await dao.readByCategoria(widget.categoria);
    setState(() {
      apps = listApps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 320, // ancho
                    height: 235, // alto
                    child: Stack(
                      children: [
                        // permite realizar el efecto de movimiento de arriba hacia abajo.
                        AnimatedPositioned(
                          duration: Duration(seconds: 2),
                          left: isMoved ? 0 : 100,
                          top: 100,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMoved =
                                    !isMoved; // Cambia el estado al presionar el texto
                              });
                            },
                            child: Text(
                              'SOFTECH',
                              style: GoogleFonts.audiowide(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                // Fuente de estilo tecnológico
                                letterSpacing:
                                    3, // Espaciado entre letras para dar un toque más moderno
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 3, // Grosor del borde
              color: Colors.blue, // Color azul del borde
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                'Catalogo',
                style: GoogleFonts.gabarito(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  // Fuente de estilo tecnológico
                  letterSpacing:
                      3, // Espaciado entre letras para dar un toque más moderno
                  color: const Color.fromARGB(255, 61, 61, 61),
                ),
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: apps.length,
                itemBuilder: (ctx, index) {
                  final aplicacion = apps[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(33, 34, 34, 34),
                      border: Border.all(
                        color: Color(0xFF00e2d4), // Color del borde
                        width: 2.0, // Grosor del borde
                      ),
                      borderRadius:
                          BorderRadius.circular(10.0), // Bordes redondeados
                    ),
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            aplicacion.urlImage,
                            width: 50,
                            height: 50,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 2, // Grosor de la línea
                            height: 60, // Altura de la línea
                            color: Color(0xFF00e2d4), // Color de la línea
                            margin: const EdgeInsets.symmetric(
                                horizontal:
                                    10), // Espacio alrededor de la línea
                          ),
                          Expanded(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                aplicacion.nombrePrograma,
                                style: GoogleFonts.gabarito(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  // Fuente de estilo tecnológico
                                  letterSpacing:
                                      3, // Espaciado entre letras para dar un toque más moderno
                                  color: const Color.fromARGB(255, 61, 61, 61),
                                ),
                              ),
                              Text(
                                'Precio:${aplicacion.precio} Dolares',
                                style: GoogleFonts.sofiaSansSemiCondensed(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  // Fuente de estilo tecnológico
                                  letterSpacing:
                                      3, // Espaciado entre letras para dar un toque más moderno
                                  color: const Color.fromARGB(255, 61, 61, 61),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
