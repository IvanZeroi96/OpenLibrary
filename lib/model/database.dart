import 'package:robin_food_library/model/favorite_model/favorite_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'favorite.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE favorites(id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT NOT NULL, contenido TEXT NOT NULL, autores TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<bool> insertUser(Favorite favorite) async {
    int result = 0;
    try {
      final Database db = await initializeDB();
      result = await db.insert('favorites', favorite.toMap());
      return true;
    }catch(e){
      return false;
    }
  }

  Future<dynamic> getListaFavoritos() async {
    final Database db = await initializeDB();
    try {
      final List<Map<String, Object?>> queryReponse = await db.query(
          'favorites');
      return queryReponse.map((e) => Favorite.fromMap(e)).toList();
    }catch(e){
      return null;
    }
  }
}