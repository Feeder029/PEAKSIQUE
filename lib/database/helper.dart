import 'package:sqflite/sqflite.dart';


class PeaksiqueDatabase {
  static final PeaksiqueDatabase instance = PeaksiqueDatabase._init();

  static Database? _database;

  PeaksiqueDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB('peaksique.db'); 
    return _database!;
  }

  Future<Database?> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<Database> _createDB(Database db, int version) async {

  }
  
  Future close() async {
    final db = await instance.database;

    db.close();
  }
  
}


