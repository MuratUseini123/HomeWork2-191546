import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../Model/TerminModel.dart';

class TerminHelper {
  static List<Termin> temp = <Termin>[];
}

class TerminDatabaseHelper {
  TerminDatabaseHelper._privateConstructor();
  static final TerminDatabaseHelper instance =
      TerminDatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'termin.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE termin(
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          course_name TEXT,
          termin_date TEXT,
          created_by INTEGER,
          latitude REAL,
          longitude REAL
      )
      ''');
  }

  Future<List<Termin>> getTermins() async {
    Database db = await instance.database;
    var dbusers = await db.query('termin', orderBy: 'course_name');
    List<Termin> termins = dbusers.isNotEmpty
        ? dbusers.map((c) => Termin.fromMap(c)).toList()
        : [];
    TerminHelper.temp = termins;
    return termins;
  }

  Future<int> addTermin(Termin new_termin) async {
    Database db = await instance.database;
    Map<String, dynamic> map = new_termin.toMap();
    map['latitude'] = new_termin.latitude;
    map['longitude'] = new_termin.longitude;
    return await db.insert('termin', map);
  }

  Future<int> updateTermin(Termin termin) async {
    Database db = await instance.database;
    return await db.update('termin', termin.toMap(),
        where: "id = ?", whereArgs: [termin.id]);
  }
}
