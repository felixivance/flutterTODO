import 'package:flutter_todo_app/database/operations.dart';
import 'package:flutter_todo_app/models/category.dart';

class CategoryService{

  Operations _operations;

  CategoryService(){
    _operations = Operations();
  }

  saveCategory(Category category) async{
    return await _operations.save("category", category.categoryMap());
  }
}