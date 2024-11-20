import 'package:flutter/material.dart';
import 'package:navegaciones/databases/DatabaseHelper.dart';
import 'package:navegaciones/menu/menu.dart';
import 'package:navegaciones/pages/addServices.dart';

import 'rutas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      //initialRoute: '/add',
      routes: {
        '/add': (context) => Addservices(),
        '/inicio': (context) => Inicio(),
        '/nosotros': (context) => nosotros(),
        '/contactos': (context) => Contactos(),
        '/registro': (context) => registro(),
      },
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(80, 0, 213, 255),
      )),
    );
  }
}
