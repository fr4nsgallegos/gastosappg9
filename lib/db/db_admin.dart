import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbAdmin {
  Database? myDatabase;

  Future<Database?> checkDataBase() async {
    if (myDatabase == null) {
      myDatabase = await _initDatabase();
    }
    return myDatabase;
  }

  Future<Database> _initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String pathDatabase = join(directory.path, "PagosDB.db");
    print(pathDatabase);
    return await openDatabase(
      pathDatabase,
      version: 1,
      onCreate: (Database db, int version) {
        db.execute("""CREATE TABLE GASTOS(
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    title TEXT,
                    price REAL,
                    datetime TEXT,
                    type TEXT)
                    """);
      },
    );
  }

  // INSERTAR GASTOS
  insertarGasto() async {
    Database? db = await checkDataBase();
    int res = await db!.insert(
      "GASTOS",
      {
        "title": "Compras de mercado",
        "price": 256.5,
        "datetime": "31/08/2024",
        "type": "Alimentos",
      },
    );
    print(res);
  }

  //OBTENER GASTOS
  obtenerGastos() async {
    Database? db = await checkDataBase();
    List data = await db!.query("GASTOS");
    print(data);
  }

  // ELIMNAR GASTO

  // ACTUALIZAR GASTO
}
