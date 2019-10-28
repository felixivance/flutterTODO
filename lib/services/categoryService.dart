import 'package:flutter_todo_app/database/operations.dart';
import 'package:flutter_todo_app/models/category.dart';

class CategoryService{

  Operations _operations;

  CategoryService(){
    _operations = Operations();
  }

  saveCategory(Category category) async{
    return await _operations.save("categories", category.categoryMap());
  }

  getCategories() async{
    return await _operations.getAll("categories");
  }
  updateCategory(Category category) async{
    return await _operations.updateItem('categories', category.categoryMap());
  }

  getCategoryById(categoryId) async{
    return await _operations.getById("categories", categoryId);
  }

  deleteCategoryById(categoryId) async{
    return await _operations.deleteItem("categories", categoryId);
  }
}