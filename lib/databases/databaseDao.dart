import 'package:navegaciones/databases/DatabaseHelper.dart';
import 'package:navegaciones/models/appsModels.dart';

class DatabaseDao {
  final database = DatabaseHelper.instance.db;
  Future<List<Appsmodels>> readAll() async {
    final data = await database.query('servicios');
    print(data);
    return data.map((e) => Appsmodels.fromMap(e)).toList();
  }

  Future<int> insert(Appsmodels servicios) async {
    return await database.insert('servicios', {
      'urlImage': servicios.urlImage,
      'nombrePograma': servicios.nombrePrograma,
      'categoria': servicios.categoria,
      'precio': servicios.precio,
    });
  }

  Future<void> update(Appsmodels servicios) async {
    await database.update('servicios', servicios.toMap(),
        where: 'id=?', whereArgs: [servicios.id]);
  }

  Future<void> delete(Appsmodels servicios) async {
    await database
        .delete('servicios', where: 'id=?', whereArgs: [servicios.id]);
  }
}
