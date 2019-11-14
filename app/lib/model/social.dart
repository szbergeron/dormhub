import 'package:flutter/widgets.dart';

class Social {
  String title;
  String description;
  String date;
  // Image picture;
  // DateTime date;
  

  Social(
      {this.title, this.description,this.date});

      Map<String,dynamic> toMap(){
       var map = new Map();
        map = {"title": title, "description": description, "date":date};
        return map;
      }
}