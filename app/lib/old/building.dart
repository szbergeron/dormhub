import 'package:flutter/material.dart';

class Building extends StatelessWidget {
  final String buildingTag;

  Building({this.buildingTag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(buildingTag),
        backgroundColor: Color.fromRGBO(0, 51, 145, 1),
      ),
      body: Container(
        child: Hero(
          child: Center(
            heightFactor: 1,
            child: SizedBox(
              width: 500,
              height: 200,
              child: Card(
                  child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [0.1, 0.6, 0.9],
                              colors: [Colors.cyan, Colors.blue, Colors.blue])),
                      child: Center(
                          child: Text(
                        buildingTag,
                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
                      )))),
            ),
          ),
          tag: buildingTag,
        ),
      ),
    );
  }
}
