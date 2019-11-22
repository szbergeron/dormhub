import 'package:flutter/widgets.dart';

class News {
  String title;
  String description;
  String date;
  String img;
  String location;
  // Image picture;
  // DateTime date;

  News({this.title, this.description, this.date, this.img, this.location});

  Map<String, dynamic> toMap() {
    var map = new Map();
    map = {
      "name": title,
      "description": description,
      "date": date,
      "img": img,
      "location": location
    };
    return map;
  }
}
