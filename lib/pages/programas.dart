import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text(widget.categoria
            .capitalize()), // Asumiendo que tienes un método para capitalizar strings
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: apps.length,
                itemBuilder: (ctx, index) {
                  final aplicacion = apps[index];
                  return ListTile(
                    leading: Image.asset(
                      aplicacion.urlImage,
                      width: 50,
                      height: 50,
                    ),
                    tileColor: const Color.fromARGB(172, 46, 46, 46),
                    textColor: Colors.white,
                    title: Text(aplicacion.nombrePrograma),
                    subtitle: Text('${aplicacion.precio} Dolares'),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
