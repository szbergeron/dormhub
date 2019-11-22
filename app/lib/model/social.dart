import 'package:flutter/widgets.dart';

class Social {
  String name;
  String description;
  String date;
  String img;
  String location;
  // Image picture;
  // DateTime date;

  Social({this.name, this.description, this.date, this.img, this.location});

  Map<String, dynamic> toMap() {
    var map = new Map();
    map = {
      "name": name,
      "description": description,
      "date": date,
      "img": img,
      "location": location
    };
    return map;
  }
}
