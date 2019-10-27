import 'package:flutter/material.dart';
import 'package:flutter_todo_app/helpers/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My TODO LIST", style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      drawer: DrawerNavigation(),
    );
  }
}
