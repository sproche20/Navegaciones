import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:navegaciones/models/cliente.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//Clase para realizar operacion de crud
class SqlCrud_Cliente {

//Creacion de la tabla y establcer conexion
 static  String _tableName = "cliente";
  //Establece la conexion y la crea si no existe
  static Future<Database> getDataBase() async {
    //Abrir o crear una base de datos
    return openDatabase(
      //Await espera a que la funcion se completa para continuar
      join(await getDatabasesPath(), "cliente.db"),
      onCreate: (db, version) async {
        await db.execute(
       //   "CREATE TABLE $_tableName (id TEXT PRIMARY KEY, name TEXT, age TEXT, address TEXT, description TEXT)",
          "CREATE TABLE $_tableName (id TEXT PRIMARY KEY, nombre TEXT, email TEXT, celular TEXT, clave TEXT)",

        );
      },
      version: 1,
    );
  }
//CRUD
//Insertar
  static Future<int> insert(Cliente cli) async {
    int userId = 0;
    Database db = await getDataBase();
    String path = await getDatabasesPath();
    print('''getDatabasesPath: ${path}''');
    // Se utiliza ConflictAlgorithm.replace para reemplazar un registro existente si el id es duplicado.
    await db.insert( _tableName, cli.toMap(), conflictAlgorithm: ConflictAlgorithm.replace).then((value) {
      userId = value;
    });
    return userId;
  }
  //Recupera todos los registros de la tabla
  static Future<List<Cliente>> listadoCliente() async {
    Database db = await getDataBase();
    List<Map<String, dynamic>> clienteMap = await db.query(_tableName);
        print('''SQlite: ${ clienteMap}''');
    return List.generate(clienteMap.length, (index) {
      return Cliente(
          id: clienteMap[index]["id"],
          nombre: clienteMap[index]["nombre"],
          email: clienteMap[index]["email"],
          celular: clienteMap[index]["celular"],
          clave: clienteMap[index]["clave"]);
    });
  }
  //Selecionar x Id

    static Future<Cliente> buscrClientexID(String clienteID)async{
    Database db = await getDataBase();
    List<Map<String, dynamic>> computadoraMap = await db.rawQuery("SELECT * FROM $_tableName WHERE id = $clienteID");
    if(computadoraMap.length == 1){
      return Cliente(
          id: computadoraMap[0]["id"],
          nombre: computadoraMap[0]["nombre"],
          email: computadoraMap[0]["email"],
          celular: computadoraMap[0]["celular"],
          clave: computadoraMap[0]["clave"]);
    } else {
      return Cliente();
    }
  }
    static Future<Cliente> buscrClientexCelular(String celular) async{
    Database db = await getDataBase();
    List<Map<String, dynamic>> computadoraMap = await db.rawQuery("SELECT * FROM $_tableName WHERE celular = $celular");
    if(computadoraMap.length == 1){
      return Cliente(
          id: computadoraMap[0]["id"],
          nombre: computadoraMap[0]["nombre"],
          email: computadoraMap[0]["email"],
          celular: computadoraMap[0]["celular"],
          clave: computadoraMap[0]["clave"]);
    } else {
      return Cliente();
    }
  }
//Modificar

  static Future<void> update(String clienteId, String nombre, String email, String clave, String celular) async {
    Database db = await getDataBase();
    db.rawUpdate("UPDATE $_tableName SET nombre = '$nombre', email = '$email', celular = '$celular', ram = '$clave' WHERE id = '$clienteId'");
  }

//Borrar

  static Future<void> borrarcliente(String clienteID) async {
    Database db = await getDataBase();
    await db.rawDelete("DELETE FROM $_tableName WHERE id = '$clienteID'");
  }

  static Future<int> lastInsertedRowId(String userId) async {
    Database db = await getDataBase();
    await db.execute("select last_insert_rowid()");
    return 1;
  }
}