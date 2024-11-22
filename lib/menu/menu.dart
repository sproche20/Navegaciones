import 'package:navegaciones/pages/user/login.dart';
import 'package:navegaciones/rutas.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  /**-------------------Animaciones */
  bool isMoved = false;
  bool _isVisible = true;
  /**pages---------------------------------- */
  int _selectIndex = 0;

  final List<Widget> _pages = [
    const Inicio(),
    const nosotros(),
    const Contactos(),
    //const Programas(),
    LoginPage()
    //const registro(),
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      /**appbar----------------------------------------------------------- */
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width:
                        screenWidth * (0.78), // Ajusta el ancho dinámicamente
                    height: 235, //alto
                    child: Stack(
                      children: [
                        //permite realizar el efecto de movimiento de arriba hacia abajo.
                        AnimatedPositioned(
                          duration: Duration(seconds: 2),
                          left: isMoved ? 1 : 100,
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
                                fontSize: screenWidth * 0.08,
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
      /**menu lateral--------------------------------------------- -----------------------------------------------*/
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            /**cabecera---------------------------------------------------------------------- -----------------------------------------------*/
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(80, 255, 255, 255),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blue,
                      width: 2.0, // Color del borde inferior
                    ),
                  ),
                ),
                child: Container(
                  height:
                      screenHeight * 1.0, // Cambia la altura del DrawerHeader
                  width:
                      double.infinity, // O un valor específico si lo prefieres
                  child: Column(
                    children: [
                      /**contenedor imagen---------------------- --------------------------------------------------*/
                      Container(
                        height: screenHeight *
                            0.12, // Ajusta la altura de la imagen
                        width:
                            screenWidth * 0.5, // Ajusta el ancho de la imagen
                        child: const AnimationControllers(
                          imagePath: 'assets/logo.png',
                          duration: Duration(seconds: 3),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isVisible =
                                !_isVisible; // Cambia la visibilidad al tocar
                          });
                        },
                        child: AnimatedOpacity(
                          opacity:
                              _isVisible ? 1.0 : 0.3, // Controla la opacidad
                          duration: const Duration(
                              milliseconds: 300), // Duración de la animación
                          child: Text(
                            'Soluciones Informaticas',
                            style: GoogleFonts.audiowide(
                                color: const Color.fromARGB(255, 114, 114, 114),
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            /**menus opciones parte de abajo------------------------------------------------------------------ */
            ListTile(
              leading: Icon(
                Icons.home,
                size: screenWidth * 0.08,
              ),
              title: Text(
                'Inicio',
                style: TextStyle(fontSize: screenWidth * 0.05),
              ),
              onTap: () {
                _selectPage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.people_sharp),
              title: Text(
                'Nosotros',
                style: TextStyle(fontSize: screenWidth * 0.05),
              ),
              onTap: () {
                _selectPage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: Text(
                'Contactanos',
                style: TextStyle(fontSize: screenWidth * 0.05),
              ),
              onTap: () {
                _selectPage(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_add),
              title: Text(
                'Registro',
                style: TextStyle(fontSize: screenWidth * 0.05),
              ),
              onTap: () {
                //_selectPage(3);
                Navigator.pushNamed(context, '/registro');
              },
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: Text(
                'Login',
                style: TextStyle(fontSize: screenWidth * 0.05),
              ),
              onTap: () {
                _selectPage(3);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectIndex],
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectIndex = index;
    });
  }
}
