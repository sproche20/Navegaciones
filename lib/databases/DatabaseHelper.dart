import 'package:sqflite/sqflite.dart';

class Databasehelper {
  static Databasehelper? _databasehelper;
  Databasehelper.internal();
  static Databasehelper get instance =>
      _databasehelper ??= Databasehelper.internal();
  Database? _db;
  Database get db => _db!;
  Future<void> init() async {
    print('iniciando la base datos');
    _db = await openDatabase(
      'database.db',
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        create table programas
        (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nombrePrograma varchar(255),
          precio varchar(100),
        ); 
    ''');
      },
    );
  }
}
