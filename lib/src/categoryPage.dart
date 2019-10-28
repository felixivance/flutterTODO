import 'package:flutter/material.dart';
import 'package:flutter_todo_app/helpers/drawer.dart';
import 'package:flutter_todo_app/models/category.dart';
import 'package:flutter_todo_app/services/categoryService.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  TextEditingController _categoryName = new TextEditingController();

  TextEditingController _categoryDescription = new TextEditingController();

  var _category = new Category();
  var _categoryService = new CategoryService();

//  method 1
  List <Widget> _categoryList = List<Widget>();

  @override
  void initState(){
    super.initState();
    getAllCategories();
  }

  getAllCategories() async{

    var categories = await _categoryService.getCategories();

    categories.forEach((category){
      print(category['name']);

      //method 1
      setState(() {
        _categoryList.add(
            Card(
              child: ListTile(
                leading: IconButton( icon: Icon(Icons.edit, color: Colors.green,) , onPressed: (){},),
                title: Text(category['name']),
                trailing: IconButton( icon: Icon(Icons.delete, color: Colors.red,) , onPressed: (){},),
              ),

            )
        );
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _addFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: _categoryList,
      ),
    );
  }

  _addFormDialog(BuildContext context){

    return showDialog(context: context, barrierDismissible: true, builder: (param){
      return AlertDialog(
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Text("Cancel"),
          ),
          FlatButton(
            onPressed: () async{
              this._category.name = _categoryName.text;
              this._category.description = _categoryDescription.text;

               var result =    await  _categoryService.saveCategory(this._category);

               print (result); //returns 1 for success and 0 for failure

              _categoryList.clear(); //clear array

              getAllCategories();

              Navigator.of(context).pop();

            },
            child: Text("Save"),
          )
        ],
        title: Text("Add Category"),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _categoryName,
                decoration: InputDecoration(
                    labelText: "Category Name",
                    hintText: "Write the category name"
                ),
              ),
              TextField(
                controller: _categoryDescription,
                decoration: InputDecoration(
                  labelText: "Description ",
                  hintText: "Write the description",
                ),
                maxLines: 3,
              ),

            ],
          ),
        ),
      );
    });
  }


}
