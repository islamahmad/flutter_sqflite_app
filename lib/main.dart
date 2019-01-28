import 'package:flutter/material.dart';
import 'package:sqflite_app/ui/Home.dart';
import 'package:sqflite_app/utils/db_helper.dart';

void main() async {
  var db = DbHelper();
  // add user to db
  int result = await db.getUsersCount();
  debugPrint("User inserted ?  $result");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'learning sqflite',
    home: Home(),
  ));
}
