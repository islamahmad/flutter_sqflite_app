import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_app/models/User.dart';

class DbHelper {
  // this is a single instance from this class that will be used everywhere
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
    String path = join(documentDirectory.path, "my_db.db");
    Database newDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return newDB;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE $tableName ($columnID INTEGER PRIMARY KEY , $columnName TEXT , $columnPass TEXT)");
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
    int result = await dbClient.update(tableName, user.toMap(),
        where: '$columnID = ?', whereArgs: [user.id]);
    return result;
  }

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    int result = await dbClient
        .delete(tableName, where: '$columnID = ?', whereArgs: [id]);
    String Sql = "";
    return result;
  }

  Future<User> retrieveUser(int id) async {
    var dbClient = await db;
    String Sql = "SELECT * FROM $tableName WHERE $columnID = $id";
    var result = await dbClient.rawQuery(Sql);
    if (result.length != 0) {
      // my method
//      User user = User.fromMap(result.first);
//      return user;
      //the video method
      return User.fromMap(result.first);
      // used first as in the video and it removed the error where
      // the SDK showed future<List<Map<String, dynamic>>> cannot be used as a Map
    } else {
      return null;
    }
  }

  Future<List> getAllUsers() async {
    var dbClient = await db;
    String Sql = "SELECT * FROM $tableName";
    var users = await dbClient.rawQuery(Sql);
    return users;
  }

  Future<int> getUsersCount() async {
    var dbClient = await db;
    String Sql = "SELECT COUNT(1) FROM $tableName"; // prepare the query
    var result = await dbClient.rawQuery(Sql); // run the query and get the List
    int count = Sqflite.firstIntValue(
        result); // gets the first integer of the result (in this case it's the count)
    return count;
  }

  Future close() async {
    // always close DB after use
    var dbClient = await db;
    return dbClient.close();
  }
}
