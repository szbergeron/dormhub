import 'package:dormshub/views/intro.dart';
import 'package:flutter/material.dart';
import 'package:dormshub/views/welcome.dart';
import 'views/home.dart';
import 'login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: IntroductionPage()// HomePage(),
    );
  }
}

