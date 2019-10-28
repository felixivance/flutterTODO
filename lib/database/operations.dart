import 'package:flutter_todo_app/database/db_connection.dart';
import 'package:sqflite/sqflite.dart';

class Operations{
  DatabaseConnection _connection;

  Operations(){
    _connection = DatabaseConnection();
  }

  static Database _database;

  Future<Database> get database async{
    if(_database !=null ) return _database;
    _database = await _connection.setDatabase();

    return _database;
  }

  save(table, data) async{
    var $conn = await database;

    return await $conn.insert(table, data);
  }
}