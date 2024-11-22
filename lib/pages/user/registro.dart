import 'dart:async';
import 'package:flutter/material.dart';
import 'package:navegaciones/databases/Login_Firebase.dart';
import 'package:navegaciones/rutas.dart';
import 'package:google_fonts/google_fonts.dart';

class registro extends StatefulWidget {
  const registro({super.key});

  @override
  State<registro> createState() => _RegistroState();
}

class _RegistroState extends State<registro> {
  bool isMoved = false;
  // bool _isVisible = true;
  bool isColorChanged = false;
  Timer? _timer;

  final Login _loginFirebase = Login();
  // Controladores de texto para los campos de entrada
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _claveController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Inicia el temporizador que alternará el color cada 3 segundos
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (mounted) {
        // Verificamos que el widget aún está montado
        setState(() {
          isColorChanged = !isColorChanged;
        });
      }
    });
  }

  @override
  void dispose() {
    // Cancelamos el temporizador para evitar que se ejecute después del dispose
    _timer?.cancel();

    // Limpiar los controladores de texto
    _nombreController.dispose();
    _claveController.dispose();
    _emailController.dispose();
    _celularController.dispose();
    super.dispose();
  }

  void _registrarUsuario() async {
    if (_formKey.currentState?.validate() ?? false) {
      await _loginFirebase.registrarUsuario(
        _emailController.text,
        _claveController.text,
      );
      // Mostrar un diálogo de confirmación
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Datos Registrados'),
          content: const Text('Bienvenidos a la comunidad'),
          actions: [
            TextButton(
              onPressed: () {
                // Limpiar los campos de texto
                _nombreController.clear();
                _claveController.clear();
                _emailController.clear();
                _celularController.clear();
                Navigator.of(context).pop(); // Cierra el diálogo
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Inicio()),
                );
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 300,
                  /**AnimatedContainer, nos permite animar manualmente o automaticamente una transicion de colores,*/
                  child: Container(
                    height: 230.0,
                    width: 690.0,
                    margin: EdgeInsets.all(0),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 245, 245, 245),
                        image: DecorationImage(
                            image: AssetImage('assets/users.png'),
                            fit: BoxFit.contain)),
                  ),
                ),
                SizedBox(
                  width: 350,
                  /**AnimatedContainer, nos permite animar manualmente o automaticamente una transicion de colores,*/
                  child: AnimatedContainer(
                    //height: 400.0,
                    width: 560.0,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isColorChanged // efecto de transicion de colores
                            ? Colors.blue
                            : Color.fromARGB(255, 0, 251, 255),
                        width: 4.0,
                      ),
                      // width: 3.0
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32)),
                      color: const Color.fromARGB(255, 33, 150, 243),
                    ),
                    duration: Duration(
                        seconds: 1), // Duración de la animación de color
                    curve: Curves.easeInOut,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        inputs.inputNombre(_nombreController),
                        const SizedBox(
                          height: 10,
                        ),
                        inputs.inputClave(_claveController),
                        const SizedBox(
                          height: 10,
                        ),
                        inputs.inputEmail(_emailController),
                        const SizedBox(
                          height: 10,
                        ),
                        inputs.inputCelular(_celularController),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.person,
                          size: 50,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        onPressed: _registrarUsuario,
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: const StadiumBorder(
                            side: BorderSide(
                              color: Color.fromARGB(
                                  255, 0, 251, 255), // Color del borde
                              width: 3.0, // Ancho del borde
                            ),
                          ),
                          backgroundColor: Color.fromARGB(255, 33, 150, 243),
                        ),
                        label: const Text('Registrar'),
                      ),
                    ),
                    SizedBox(
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.home,
                          size: 50,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: const StadiumBorder(
                            side: BorderSide(
                              color: Color.fromARGB(
                                  255, 0, 251, 255), // Color del borde
                              width: 3.0, // Ancho del borde
                            ),
                          ),
                          backgroundColor: Color.fromARGB(255, 33, 150, 243),
                        ),
                        label: const Text('Regresar'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
