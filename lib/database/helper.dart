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
    if (_database != null) return _database!;

    _database = await _initDB('peaksique.db'); //create database if none
    return _database!;
  }

  Future<Database?> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    ); //for update etc
  }

  //create the table
  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
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

      FOREIGN KEY (${ProfileFields.accId})
      REFERENCES $accountTable (${AccountFields.accId})
      )
    ''');

    await db.execute('''
      CREATE TABLE $statisticsTable (
        ${StatisticsFields.statId} $idType,
        ${StatisticsFields.pId} $intType,
        ${StatisticsFields.workouts} $intType,
        ${StatisticsFields.lifted} $intType,
        ${StatisticsFields.streak} $intType,

      FOREIGN KEY (${StatisticsFields.pId})
      REFERENCES $profileTable (${ProfileFields.pId})
      )
    ''');

    await db.execute('''
      CREATE TABLE $workoutTable (
        ${WorkoutFields.wId} $idType,
        ${WorkoutFields.pId} $intType,
        ${WorkoutFields.name} $textType,
        ${WorkoutFields.date} $dateType,
        ${WorkoutFields.status} $textType,

      FOREIGN KEY (${WorkoutFields.pId})
      REFERENCES $profileTable (${ProfileFields.pId})
      )
    ''');

    await db.execute('''
      CREATE TABLE $activityTable (
        ${ActivityFields.actId} $idType,
        ${ActivityFields.wId} $intType,
        ${ActivityFields.name} $textType,
        ${ActivityFields.status} $textType,

      FOREIGN KEY (${ActivityFields.wId})
      REFERENCES $workoutTable (${WorkoutFields.wId})
      )
    ''');

    await db.execute('''
      CREATE TABLE $setsTable (
        ${SetsFields.setId} $idType,
        ${SetsFields.actId} $intType,
        ${SetsFields.sets} $intType,
        ${SetsFields.reps} $intType,
        ${SetsFields.rest} $timeType,
        ${SetsFields.status} $textType,
      
      FOREIGN KEY (${SetsFields.actId})
      REFERENCES $activityTable (${ActivityFields.actId})
      )
    ''');
  }

  Future<WorkoutModel> createWorkout(WorkoutModel workout) async {
    final db = await instance.database;
    final id = await db.insert(workoutTable, workout.toMap());
    return workout.copy(wId: id);
  }

  Future<ActivityModel> createActivity(ActivityModel activity) async {
    final db = await instance.database;
    final id = await db.insert(activityTable, activity.toMap());
    return activity.copy(actId: id);
  }

  Future<SetsModel> createSets(SetsModel sets) async {
    final db = await instance.database;
    final id = await db.insert(setsTable, sets.toMap());
    return sets.copy(setId: id);
  }

  Future<WorkoutModel> readWorkout(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      workoutTable,
      columns: WorkoutFields.values,
      where: '${WorkoutFields.wId} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty) {
      return WorkoutModel.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<ActivityModel> readActivity(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      activityTable,
      columns: ActivityFields.values,
      where: '${ActivityFields.actId} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty) {
      return ActivityModel.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<SetsModel> readSets(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      setsTable,
      columns: SetsFields.values,
      where: '${SetsFields.setId} = ?',
      whereArgs: [id],
    );

    if(maps.isNotEmpty) {
      return SetsModel.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
