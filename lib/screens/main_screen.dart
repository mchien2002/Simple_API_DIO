// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_api_app/screens/comment_screen.dart';
import 'package:my_api_app/screens/post_screen.dart';
import 'package:my_api_app/screens/todo_screen.dart';
import 'package:my_api_app/screens/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  void btnPress(String screen){
    if (screen == "USERS"){
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => const UserScreen())
      );
    }
    else if (screen == "POSTS"){
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => const PostScreen  ())
      );
    }
    else if (screen == "COMMENTS"){
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => const CommentsScreen())
      );
    }
    else if (screen == "TODOS"){
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => const TodoScreen())
      );
    }
  }

  Widget buidlButton(String btnText, Color btnColor){
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(5),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: btnColor),
        ),
        onPressed: () => btnPress(btnText),
        padding: const EdgeInsets.all(10.0),
        color: btnColor,
        textColor: Colors.white,
        child: Text(btnText, style: const TextStyle(fontSize: 20),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API USING DIO"),
      ),

      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget>[
              buidlButton("USERS", Colors.blue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget>[
              buidlButton("POSTS", Colors.blue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget>[
              buidlButton("COMMENTS", Colors.blue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget>[
              buidlButton("TODOS", Colors.blue),
            ],
          ),
        ],      
      ),
    );
  }
}