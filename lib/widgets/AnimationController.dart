import 'package:flutter/material.dart';

class AnimationControllers extends StatefulWidget {
  final String imagePath; //  Guarda la ruta de la imagen que se desea mostrar.
  final Duration duration; // Duración de la animación
/**se encarga de la imagen */
  const AnimationControllers({
    Key? key,
    required this.imagePath,
    this.duration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  _AnimatedOpacityImageState createState() => _AnimatedOpacityImageState();
}

class _AnimatedOpacityImageState extends State<AnimationControllers>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Inicializa el AnimationController
    _controller = AnimationController(
      duration: widget.duration, // Usar la duración proporcionada
      vsync: this, // Para la sincronización
    );

    // Define la animación
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {}); // Redibuja cuando el valor de la animación cambia
      });

    // Inicia la animación
    _controller.forward(); // Lanza la animación al principio
  }

  @override
  void dispose() {
    _controller.dispose(); // Libera los recursos
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animation.value, // Aplica el valor de opacidad
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                widget.imagePath), // Usa la ruta de la imagen proporcionada
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
