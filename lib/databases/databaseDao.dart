import 'package:navegaciones/databases/DatabaseHelper.dart';
import 'package:navegaciones/models/appsModels.dart';

class DatabaseDao {
  final database = DatabaseHelper.instance.db;
  Future<List<Appsmodels>> readAll() async {
    final data = await database.query('programas');
    print(data);
    return data.map((e) => Appsmodels.fromMap(e)).toList();
  }
}
