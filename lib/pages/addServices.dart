import 'package:flutter/material.dart';
import 'package:navegaciones/databases/databaseDao.dart';
import 'package:navegaciones/models/appsModels.dart';

class Addservices extends StatefulWidget {
  const Addservices({super.key});

  @override
  State<Addservices> createState() => _AddservicesState();
}

class _AddservicesState extends State<Addservices> {
  List<Appsmodels> servicios = [];
  final dao = DatabaseDao();
  @override
  void initState() {
    super.initState();
    dao.readAll().then((value) {
      setState(() {
        servicios = value;
      });
    });
  }

  @override
  void dispose() {
    _url.dispose();
    _nombrePrograma.dispose();
    _categoria.dispose();
    _precio.dispose();
  }

  final TextEditingController _url = TextEditingController();
  final TextEditingController _nombrePrograma = TextEditingController();
  final TextEditingController _categoria = TextEditingController();
  final TextEditingController _precio = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('registro servicios'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final url = _url.text;
                      final nombrePrograma = _nombrePrograma.text;
                      final categoria = _categoria.text;
                      final precios = _precio.text;
                      Appsmodels servicio = Appsmodels(
                          urlImage: url,
                          nombrePrograma: nombrePrograma,
                          categoria: categoria,
                          precio: precios);
                      final id = await dao.insert(servicio);
                      servicio = servicio.copyWith(id: id);
                      _url.clear();
                      _nombrePrograma.clear();
                      _categoria.clear();
                      _precio.clear();
                      setState(() {
                        servicios.add(servicio);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Registro exitoso'),
                        ),
                      );
                    } else {
                      print('Formulario inválido');
                    }
                  },
                  style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 246, 246, 246),
                      shape: StadiumBorder(
                          side: BorderSide(
                              color: const Color.fromARGB(255, 255, 149, 0),
                              width: 3.0)),
                      backgroundColor: const Color.fromARGB(255, 56, 56, 56)),
                  child: Text('registrar'))
            ],
          ),
        ),
      ),
    );
  }
}
