import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:navegaciones/databases/DatabaseHelper.dart';
import 'package:navegaciones/menu/menu.dart';
import 'package:navegaciones/models/appsModels.dart';
import 'package:navegaciones/pages/admin/editar.dart';
import 'package:navegaciones/pages/admin/programasAdmin.dart';
import 'package:navegaciones/pages/user/contactos1.dart';
import 'package:navegaciones/pages/user/login.dart';
import 'package:navegaciones/pages/admin/addServices.dart';
import 'package:navegaciones/pages/user/programas.dart';
import 'rutas.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Asegura que los widgets de Flutter estén inicializados correctamente.
  await Firebase
      .initializeApp(); // Inicializa Firebase para usar sus servicios.
  await DatabaseHelper.instance.init();
  await DatabaseHelper.instance.showTableData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const Menu(),
      // initialRoute: '/add',
      routes: {
        '/add': (context) => Addservices(),
        '/inicio': (context) => Inicio(),
        '/nosotros': (context) => nosotros(),
        '/contactos': (context) => Contactos(),
        '/registro': (context) => registro(),
        '/login': (context) => LoginPage(),
        '/contactos1': (context) => Contactos1(),
        '/listAdmin': (context) => ProgramasAdmin(),
        '/programas': (context) => Programas(
              categoria: '',
            ),
      },
      onGenerateRoute: (setting) {
        if (setting.name == '/editar') {
          final apps = setting.arguments as Appsmodels;
          return MaterialPageRoute(builder: (context) => Editar(apps: apps));
        }
        return null;
      },
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(80, 0, 213, 255),
      )),
    );
  }
}
