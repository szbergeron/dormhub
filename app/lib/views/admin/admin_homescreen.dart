import 'package:flutter/material.dart';

class AdminHomeScreen extends StatefulWidget {

  @override
  _AdminHomeScreenState createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {

  
  @override
  Widget build(BuildContext context) {
    return PageView(
  children: <Widget>[
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.cyan,
    ),
    Container(
      color: Colors.deepPurple,
    ),
    // Add children here
  ],
  scrollDirection: Axis.vertical,
);
  }
}