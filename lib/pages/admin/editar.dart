import 'package:flutter/material.dart';
import 'package:navegaciones/databases/databaseDao.dart';
import 'package:navegaciones/models/appsModels.dart';

class Editar extends StatefulWidget {
  final Appsmodels apps;
  const Editar({super.key, required this.apps});

  @override
  State<Editar> createState() => _EditarState();
}

class _EditarState extends State<Editar> {
  final dao = DatabaseDao();
  final TextEditingController _url = TextEditingController();
  final TextEditingController _nombrePrograma = TextEditingController();
  final TextEditingController _categoria = TextEditingController();
  final TextEditingController _precio = TextEditingController();
  @override
  void initState() {
    super.initState();
    _url.text = widget.apps.urlImage;
    _nombrePrograma.text = widget.apps.nombrePrograma;
    _categoria.text = widget.apps.categoria;
    _precio.text = widget.apps.precio;
  }

  @override
  void dispose() {
    _url.dispose();
    _nombrePrograma.dispose();
    _categoria.dispose();
    _precio.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Editar servicios'),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(230, 215, 215, 215),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 243)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _url,
                  decoration: InputDecoration(
                    labelText: 'urlImage',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(230, 215, 215, 215),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 243)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _nombrePrograma,
                  decoration: InputDecoration(
                    labelText: 'nombrePrograma',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(230, 215, 215, 215),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 243)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _categoria,
                  decoration: InputDecoration(
                    labelText: 'categoria',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(230, 215, 215, 215),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 243)),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: TextFormField(
                  controller: _precio,
                  decoration: InputDecoration(
                    labelText: 'precio',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  _editar(context),
                  SizedBox(
                    width: 30,
                  ),
                  _atras(context)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _atras(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          Navigator.pop(context);
        },
        style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 246, 246, 246),
            shape: StadiumBorder(
                side: BorderSide(
                    color: const Color.fromARGB(255, 255, 149, 0), width: 3.0)),
            backgroundColor: const Color.fromARGB(255, 56, 56, 56)),
        child: Text('atras'));
  }

  ElevatedButton _editar(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          final nuevaURL = _url.text;
          final nuevoNombre = _nombrePrograma.text;
          final nuevaCategoria = _categoria.text;
          final nuevoPrecio = _precio.text;
          final editarServicio = widget.apps.copyWith(
            urlImage: nuevaURL,
            nombrePrograma: nuevoNombre,
            categoria: nuevaCategoria,
            precio: nuevoPrecio,
          );
          await dao.update(editarServicio);
          Navigator.of(context).pop(editarServicio);
        },
        style: TextButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 246, 246, 246),
            shape: StadiumBorder(
                side: BorderSide(
                    color: const Color.fromARGB(255, 255, 149, 0), width: 3.0)),
            backgroundColor: const Color.fromARGB(255, 56, 56, 56)),
        child: Text('registrar'));
  }
}
