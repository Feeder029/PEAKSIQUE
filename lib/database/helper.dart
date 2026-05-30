import 'package:peaksique/models/account_model.dart';
import 'package:peaksique/models/activity_model.dart';
import 'package:peaksique/models/profile_model.dart';
import 'package:peaksique/models/sets_model.dart';
import 'package:peaksique/models/statistics_model.dart';
import 'package:peaksique/models/workout_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PeaksiqueDatabase {
  static final PeaksiqueDatabase instance = PeaksiqueDatabase._init();

  static Database? _database;

  PeaksiqueDatabase._init();

  Future<Database> get database async {
    if(_database != null) return _database!;

    _database = await _initDB('peaksique.db');  //create database if none
    return _database!;
  }

  Future<Database?> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB,); //for update etc
  }

  //create the table
  Future _createDB(Database db, int version) async {
    final idType =  'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final intType = 'INTEGER NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final dateType = 'TEXT NOT NULL';
    final timeType = 'INTEGER NOT NULL';
    final blobType = 'BLOB';

    await db.execute('''
      CREATE TABLE $accountTable (
        ${AccountFields.accId} $idType,
        ${AccountFields.email} $textType,
        ${AccountFields.password} $textType
      )
    ''');

    await db.execute('''
      CREATE TABLE $profileTable (
        ${ProfileFields.pId} $idType,
        ${ProfileFields.accId} $intType,
        ${ProfileFields.name} $textType,
        ${ProfileFields.image} $blobType,
      )
    ''');

    await db.execute('''
      CREATE TABLE $statisticsTable (
        ${StatisticsFields.statId} $idType,
        ${StatisticsFields.pId} $intType,
        ${StatisticsFields.workouts} $intType,
        ${StatisticsFields.lifted} $intType,
        ${StatisticsFields.streak} $intType,
      )
    ''');

    await db.execute('''
      CREATE TABLE $workoutTable (
        ${WorkoutFields.wId} $idType,
        ${WorkoutFields.pId} $idType,
        ${WorkoutFields.name} $idType,
        ${WorkoutFields.date} $dateType,
        ${WorkoutFields.status} $textType,
      )
    ''');

    await db.execute('''
      CREATE TABLE $activityTable (
        ${ActivityFields.actId} $idType,
        ${ActivityFields.wId} $intType,
        ${ActivityFields.name} $textType,
        ${ActivityFields.status} $textType,
      )
    ''');

    await db.execute('''
      CREATE TABLE $setsTable (
        ${SetsFields.setId} $idType,
        ${SetsFields.actId} $intType,
        ${SetsFields.set} $intType,
        ${SetsFields.rep} $intType,
        ${SetsFields.rest} $timeType,
        ${SetsFields.status} $textType,
      )
    ''');
  }
  
  Future close() async {
    final db = await instance.database;

    db.close();
  }
  
}


