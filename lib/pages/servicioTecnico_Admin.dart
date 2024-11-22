import 'package:flutter/material.dart';
import 'package:navegaciones/models/cliente.dart';
import 'package:navegaciones/models/clienteDAO.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ServicioTAdmin(),
    );
  }
}

class ServicioTAdmin extends StatefulWidget {
  @override
  _ServicioTAdminState createState() => _ServicioTAdminState();
}

class _ServicioTAdminState extends State<ServicioTAdmin> {
  final List<String> servicios = [
    'Formateo',
    'Instalación de Programas',
    'Diagnóstico de fallas',
    'Eliminación de virus',
  ];

  // Controladores de texto para los campos de entrada
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isExpanded = false; // Estado para el ancho dinámico de la tarjeta

  // Función para buscar cliente y mostrar un diálogo si no se ingresa celular
  Future<Cliente> buscarCliente(String celular) async {
    // Simulación de búsqueda (reemplazar con lógica real)
    Cliente nuevoC = await SqlCrud_Cliente.buscrClientexCelular(celular);
    return nuevoC;
  }

  //Insertar Cliente
  static Future<int> insertarCliente(
      String nombre, String email, String celular) async {
    // Crear una instancia del cliente con los datos recibidos
    Cliente nuevoCliente = Cliente(
      id: DateTime.now()
          .millisecondsSinceEpoch
          .toString(), // Generamos un ID único con la fecha y hora actual
      nombre: nombre,
      email: email,
      celular: celular,
      clave: celular,
    );

    // Llamar al método insert de la clase SqlCrud_Cliente
    return await SqlCrud_Cliente.insert(
        nuevoCliente); // insert es el método que ya tienes para insertar en la base de datos
  }

  void _insertarCliente() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Si el formulario es válido, insertar el cliente
      String nombre = _nombreController.text;
      String email = _emailController.text;
      String celular = _celularController.text;

      // Llamar al método insertarCliente
      int result = await insertarCliente(nombre, email, celular);

      // Mostrar un mensaje de éxito
      if (result > 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cliente agregado exitosamente')),
          
        );
        print('Cliente agregado exitosamente');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al agregar cliente')),
        );
        print('Cliente no agregado exitosamente');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Formulario Servicio',
          style: TextStyle(
            color: Colors.white,  // Cambia el color del texto a blanco
            fontWeight: FontWeight.bold,  // Hace el texto más grueso
            fontSize: 24,  // Tamaño del texto (opcional, ajusta según tu preferencia)
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: _isExpanded
              ? MediaQuery.of(context).size.width * 0.9
              : MediaQuery.of(context).size.width * 0.85,
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(color: Colors.blue, width: 3),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Imagen al inicio
                    Image.asset(
                      'assets/logo.png', // Asegúrate de tener esta imagen en tu carpeta assets
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8),
                    // Título
                    Text(
                      'Registro de Servicio',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    // Campo de Celular con botón Buscar
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _celularController,
                            decoration: InputDecoration(
                              labelText: 'Celular',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        SizedBox(width: 8),
                        ElevatedButton.icon(
                          onPressed: () async {
                            // Realiza la búsqueda del cliente
                            String celular = _celularController.text.trim();

                            if (celular.isEmpty) {
                              // Validación inicial si el campo está vacío
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'Por favor ingresa un número de celular.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Aceptar'),
                                    ),
                                  ],
                                ),
                              );
                              return;
                            }

                            try {
                              Cliente cliente =
                                  await SqlCrud_Cliente.buscrClientexCelular(
                                      celular);

                              if (cliente.id != null) {
                                // Si se encuentra el cliente, llena los campos correspondientes
                                _nombreController.text = cliente.nombre ?? '';
                                _emailController.text = cliente.email ?? '';
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Cliente encontrado.')),
                                );
                              } else {
                                // Si no se encuentra el cliente, muestra un diálogo para registrar nuevos datos
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Cliente no encontrado'),
                                    content: Text(
                                      'No se encontraron datos del cliente. Por favor ingresa nuevos datos para su registro.',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Aceptar'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            } catch (e) {
                              // Manejo de errores
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Error'),
                                  content: Text(
                                      'Ocurrió un error al buscar el cliente. Intenta de nuevo.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Aceptar'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          icon: Icon(Icons.search),
                          label: Text('Buscar'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    // Campo de Nombre
                    TextFormField(
                      controller: _nombreController,
                      decoration: InputDecoration(
                        labelText: 'Nombre',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un nombre';
                  }
                  return null;
                },
                    ),
                    SizedBox(height: 16),
                    // Campo de Email
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un email';
                  }
                  return null;
                },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16),
                    // Dropdown para servicios (solitario)
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: 'Servicios',
                        border: OutlineInputBorder(),
                      ),
                      items: servicios.map((servicio) {
                        return DropdownMenuItem<String>(
                          value: servicio,
                          child: Text(servicio),
                        );
                      }).toList(),
                      onChanged: (value) {
                        // Acción cuando se selecciona un servicio
                      },
                    ),
                    SizedBox(height: 16),
                    // Campo de Precio (suelto)
                    TextFormField(
                      controller: _precioController,
                      decoration: InputDecoration(
                        labelText: 'Precio',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 16),
                    // Campo de Descripción
                    TextFormField(
                      controller: _descripcionController,
                      decoration: InputDecoration(
                        labelText: 'Descripción',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                    ),
                    SizedBox(height: 16),
                    // Botón de Ingresar
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _isExpanded =
                              !_isExpanded; // Cambiar el estado al hacer clic
                        });
                        if (_formKey.currentState!.validate()) {
                          // Acción para ingresar
                        _insertarCliente;
                        }
                      },
                      icon: Icon(Icons.check),
                      label: Text('Ingresar'),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
