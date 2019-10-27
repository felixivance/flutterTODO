import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Felix TODO APP',
      theme: ThemeData(
//        primarySwatch: Colors.blue,
          primaryColor: Colors.white
      ),
      home: HomePage(),
    );
  }
}


