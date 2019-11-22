import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dormshub/auth/authentication.dart';
class AdminHomeScreen extends StatefulWidget {

  BaseAuth user_id;
  AdminHomeScreen({this.user_id});

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