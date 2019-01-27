import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_app/models/User.dart';

class DbHelper {
  // this is a sinlge instance from this class that will be used everywhere
  // this class is using the singleton design pattern
  static final DbHelper _instance = DbHelper.internal();
  // the internal named constructor is a convention that is used when you want
  // to use it within the class only
  DbHelper.internal();
  // the factory constructor makes sure that we are following the design pattern
  // correctly by making sure that we return the instance that we created within
  // the class,  it will allow us to cache all the state of the class
  factory DbHelper() => _instance;
  //some strings to be used in queries,etc...
  final String tableName = "userTable";
  final String columnID = "ID";
  final String columnName = "userName";
  final String columnPass = "password";
  static Database _db; // this is the database that we will use,

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
    Database newDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return newDB;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABEL $tableName ($columnID INTEGER PRIMARY KEY , $columnName TEXT , $columnPass TEXT)");
  }

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int result;
    //String Sql = "INSERT INTO $tableName "; // if we want to create the query manually
    //if you want to create the map manually
    //Map newUser = {"name": "islam", "pass": "123"};
    result = await dbClient.insert(tableName, user.toMap());
    return result;
  }

  Future<int> updateUser(User user) async {
    var dbClient = await db;
    int result = await dbClient.update(tableName, user.toMap());
    return result;
  }

  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int result = await dbClient.delete(tableName,
        where: '$columnName = ?', whereArgs: user.toMap()["name"]);
    String Sql = "";
    return result;
  }

  Future<User> retrieveUser() async {
    var dbClient = await db;
    int result;
    String Sql = "";
    //return result;
  }

  Future<List> getAllUsers() async {
    var dbClient = await db;
    String Sql = "SELECT * FROM $tableName";
    Future<List> users = dbClient.rawQuery(Sql);
    return users;
  }
}
