import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection{

  setDatabase() async{

    var directory = await getApplicationDocumentsDirectory();

    var path = join(directory.path, 'felix_todo');

    var database =  openDatabase(path, version: 1, onCreate: _onCreateDatabase );

    return database;
  }

  _onCreateDatabase(Database db, int version) async{
    await db.execute("CREATE TABLE categories(id INTEGER PRIMARY KEY, name TEXT, description TEXT)");
  }
}