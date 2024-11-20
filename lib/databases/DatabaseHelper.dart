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
        CREATE TABLE servicios
        (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          urlImage varchar(255),
          nombrePrograma varchar(255),
          categoria varchar(255),
          precio varchar(100)
        ) 
    ''');
        await db.insert('servicios', {
          'urlImage': 'assets/programas/office.png',
          'nombrePograma': 'myors',
          'categoria': 'programas',
          'precio': '80'
        });
      },
    );
  }

  Future<void> showTableData() async {
    final db = await instance.db;
    final List<Map<String, dynamic>> maps = await db.query('servicios');
    for (var row in maps) {
      print(
          'ID:${row['id']},urlImage:${row['urlImage']},nombrePograma:${row['nombrePograma']},categoria:${row['categoria']},precio:${row['precio']}');
    }
  }
}
