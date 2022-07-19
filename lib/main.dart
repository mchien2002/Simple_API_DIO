import 'package:flutter/material.dart';
import 'package:my_api_app/screens/main_screen.dart';

void main(List<String> args) {
  runApp(const MyAPIApp());
}

class MyAPIApp extends StatelessWidget {
  const MyAPIApp({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "API APP",
      home: MainScreen(),
    );
  }
}