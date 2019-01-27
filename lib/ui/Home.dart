import 'package:flutter/material.dart';
//import 'package:sqflite/sql.dart';
//import 'package:sqflite/sqflite.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'SQFLite',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Text('Text'),
          )
        ],
      ),
    );
  }
}

//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<Home> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold();
//  }
//}
