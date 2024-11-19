import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databasehelper;
  DatabaseHelper.internal();
  static DatabaseHelper get instance =>
      _databasehelper ??= DatabaseHelper.internal();
  Database? _db;
  Database get db => _db!;
  Future<void> init() async {
    print('iniciando la base datos');
    _db = await openDatabase(
      'database.db',
      version: 1,
      onCreate: (db, version) async {
        db.execute('''
        create table programas
        (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          urlImage varchar(255),
          nombrePrograma varchar(255) UNIQUE,
          precio varchar(100),
        ); 
    ''');
        try {
          await db.insert('programas', {
            'urlImage': 'assets/programas/office.png',
            'nombrePograma': 'Office 365',
            'precio': '60'
          });
        } catch (e) {
          print('Datos duplicados: ${e.toString()}');
        }
      },
    );
  }
}
