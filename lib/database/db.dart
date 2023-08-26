import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  // Construtor com acesso privado
  DB._();
  //Criar uma instancia de DB
  static final DB instance = DB._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;
    return await _initDataBase();
  }

  _initDataBase() async {
    return await openDatabase(join(await getDatabasesPath(), 'mobflix.db'),
        version: 1, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute(_videos);
  }

  String get _videos => '''
      CREATE TABLE videos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        category TEXT,
        link TEXT,
        type INTEGER
      )
  ''';
}
