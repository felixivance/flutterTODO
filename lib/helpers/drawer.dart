import 'package:flutter/material.dart';
import 'package:flutter_todo_app/src/categoryPage.dart';
import 'package:flutter_todo_app/src/homepage.dart';

class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: Colors.white
            ),
            accountName: Text('Felix',style: TextStyle(color: Colors.black),) ,
            accountEmail: Text("felixrunye@gmail.com",style: TextStyle(color: Colors.black)),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.filter_list, color: Colors.white,),
              ),
            ),
            otherAccountsPictures: <Widget>[
              GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person_pin, color: Colors.white,),
                ),
              )
            ],
          ),
          ListTile(
            title: Text('Home',style: TextStyle(color: Colors.black)),
            leading: Icon(Icons.home),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            title: Text('Categories',style: TextStyle(color: Colors.black)),
            leading: Icon(Icons.category),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryPage()));
            },
          )
        ],
      ),
    );
  }
}
