import 'package:flutter/material.dart';
import 'authentication.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
List<String> halls = [
    "Hubbard Hall",
    "Haaland Hall",
    "Mills Hall",
    "Scott Hall",
    "Handler Hall",
    "Peterson Hall",
    "Stock Hall",
    "Christensen Hall",
    "Williamson Hall",
    "Alexander Hall",
    "Upper Quad",
    "Gibbs Hall",
    "Engelhardt Hall",
    "Congreve Hall",
    "Fairchild Hall",
    "Adams Tower",
    "Hetzel Hall",
    "Hunter Hall",
    "Jessie Doe Hall",
    "Lord Hall",
    "McLaughlin Hall",
    "Sawyer Hall",
    "The Minis",
  ];


class CreateHallAcounts extends StatelessWidget {
  
  final BaseAuth auth = new Auth();
  final databaseReference = Firestore.instance;

  String usernameCreator(String s)
  {
    return s.toLowerCase().trim().replaceAll(new RegExp(r"\s+\b|\b\s"), "") + "@hallhub.com";
  }


  String passwordCreator(String s)
  {
    return "!"+s.toLowerCase().trim().replaceAll(new RegExp(r"\s+\b|\b\s"), "")+"1";
  }

  Future<bool> createDatabase() async {
     for(var i = 0; i < halls.length; i++){
    await databaseReference
        .collection("halls")
        .document(halls[i].trim().toLowerCase().replaceAll(new RegExp(r"\s+\b|\b\s"), ""))
        .setData({
          "name":halls[i],
          "events": 0,
        });
    }
    return true;
  }

  

  void createAccounts()
  {
    for(var i = 0; i < halls.length; i++){
        auth.signUp(usernameCreator(halls[i]), passwordCreator(halls[i]));
    }
    
  }

  @override
  Widget build(BuildContext context) {
      //auth.signUp("meemememm@g.com", "wadawdawdawd");
    createDatabase();

    return Container(
      child: Text("me"),
    );
  }
}