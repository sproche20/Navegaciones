
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
class inputs {
  //**Son las cajas de texto  */
  static Widget inputNombre(TextEditingController controller) {
    return Container(
      decoration: _boxDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        style: const TextStyle(fontSize: 20),
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Ingrese su nombre',
          labelStyle: _textStyle(),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese su nombre';
          }
          return null;
        },
      ),
    );
  }

  static Widget inputClave(TextEditingController controller) {
    return Container(
      decoration: _boxDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        obscureText: true,
        style: const TextStyle(fontSize: 20),
        controller: controller, // Asignar el controlador
        decoration: InputDecoration(
          labelText: 'Ingrese su contraseña',
          labelStyle: _textStyle(),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese una contraseña';
          }
          return null;
        },
      ),
    );
  }

  static Widget inputEmail(TextEditingController controller) {
    return Container(
      decoration: _boxDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        style: const TextStyle(fontSize: 20),
        controller: controller, // Asignar el controlador
        decoration: InputDecoration(
          labelText: 'Ingrese su correo',
          labelStyle: _textStyle(),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese su correo';
          }
          // Expresión regular para validar el formato del email
          String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
          RegExp regex = RegExp(pattern);
          if (!regex.hasMatch(value)) {
            return 'Por favor ingrese un correo válido';
          }
          return null;
        },
      ),
    );
  }

  static Widget inputCelular(TextEditingController controller) {
    return Container(
      decoration: _boxDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        keyboardType: TextInputType.phone, // Permite el ingreso de números
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly, // Solo permite números
        ],
        style: const TextStyle(fontSize: 20),
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Ingrese su número de teléfono',
          labelStyle: _textStyle(),
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor ingrese su número de teléfono';
          }
          return null;
        },
      ),
    );
  }

  /*---------------Decoraciones-----*/
  static BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: const Color.fromARGB(43, 255, 255, 255),
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: const Color.fromARGB(255, 255, 255, 243)),
    );
  }

  static TextStyle _textStyle() =>
      const TextStyle(color: Color.fromARGB(255, 255, 255, 255));
}