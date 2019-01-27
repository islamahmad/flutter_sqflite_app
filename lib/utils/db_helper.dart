import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB_Helper {
  // this is a sinlge instance from this class that will be used everywhere
  // this class is using the singleton design pattern
  static final DB_Helper _instance = DB_Helper.internal();
  // the factory constructor makes sure that we are following the design pattern
  // correctly by making sure that we return the instance that we created within
  // the class,  it will allow us to cache all the state of the class
  factory DB_Helper() => _instance;
  //some strings to be used in queries,etc...
  final String tableName = "userTable";
  final String columnID = "ID";
  final String columnName = "userName";
  final String columnPass = "password";
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDB();
      return _db;
    }
  }

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "mydb.db");
    Database newDB =
        await openDatabase(path, version: 1, onCreate: void _onCreate());
    return new_DB;
  }

  // the internal named constructor is a convention that is used when you want
  // to use it within the class only
  DB_Helper.internal() {}

  void _onCreate(Database db, int newVersion) async {
    await db.execute("CREATE TABEL $tableName ($columnID INTEGER PRIMARY KEY , $columnName TEXT , $columnPass TEXT)");
  }
}
