import 'package:flutter/material.dart';
import 'package:sqflite_app/ui/Home.dart';
import 'package:sqflite_app/utils/db_helper.dart';

import 'models/User.dart';

List users;
void main() async {
  var db = DbHelper();
  User record;
//   add user to db
  User toInsert = User("adam", "paass");
  int inserted = await db.saveUser(toInsert);
  debugPrint("ID of the user inserted ?  $inserted");
  int result = await db.getUsersCount();
  debugPrint("# Users inserted ?  $result");
  users = await db.getAllUsers();
  for (int i = 0; i < users.length; i++) {
    record = User.map(users[i]); // convert the list item from a map to a user
    print(record.toString());
    User searchResult = await db.retrieveUser(i);
    debugPrint(searchResult.toString());
//    await db.deleteUser((searchResult == null) ? null : searchResult.id);
  }
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'learning sqflite',
    home: Home(),
  ));
}
