import 'package:flutter/material.dart';
class CustomFooter extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Created by",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Image.asset(
                "assets/imgs/logocompany.png",
                width: 20,
                height: 20,
              ), 
              Text(
                " - Powered by",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Image.asset(
                "assets/imgs/unhlogo.png",
                width: 20,
                height: 20,
              )
            ],
          ),
        ),
    );
  }
}