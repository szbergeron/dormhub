import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

final refStream = Firestore.instance.collection("halls");

class RestInterface {
  List<String> hall;
  RestInterface({this.hall});



}
