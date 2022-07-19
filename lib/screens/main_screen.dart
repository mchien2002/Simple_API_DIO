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
      height: MediaQuery.of(context).size.height * 0.3,
      color: Colors.white,
      padding: const EdgeInsets.all(5),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(color: btnColor),
        ),
        onPressed: () => btnPress(btnText),
        padding: const EdgeInsets.all(10.0),
        color: btnColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
          const Icon(Icons.abc),
          Text(btnText, style: const TextStyle(fontSize: 20, color: Colors.black),),
        ],)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("API APP", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,      
        leading: IconButton(icon: const Icon(Icons.home_filled), color: Colors.black, onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainScreen())
          );
        },),
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // ignore: sized_box_for_whitespace
          Container(
            width: MediaQuery.of(context).size.width * 1,
            child: Table(
              children: [
                TableRow(
                  children: [
                    buidlButton("USERS", const Color.fromRGBO(245, 245, 152, 1)),
                    buidlButton("POSTS", Colors.blue),
                  ]
                ),

                TableRow(
                  children: [
                    buidlButton("COMMENTS", Colors.blue),
                    buidlButton("TODOS", Colors.blue),
                  ]
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}