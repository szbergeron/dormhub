import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dormshub/custom/custom_footer.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dormshub/views/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HallSelectionPage extends StatefulWidget {
  HallSelectionPage({Key key}) : super(key: key);

  @override
  _HallSelectionPageState createState() => _HallSelectionPageState();
}

class _HallSelectionPageState extends State<HallSelectionPage> {
  Map<int, List<String>> halls = {
    0: ["hubbardhall", "Hubbard Hall"],
    1: ["haalandhall", "Haaland Hall"],
    2: ["millshall", "Mills Hall"],
    3: ["scotthall", "Scott Hall"],
    4: ["handlerhall", "Handler Hall"],
    5: ["petersonhall", "Peterson Hall"],
    6: ["stokehall", "Stoke Hall"],
    7: ["christensenhall", "Christensen Hall"],
    8: ["williamsonhall", "Williamson Hall"],
    9: ["alexanderhall", "Alexander Hall"],
    10: ["upperquad", "Upper Quad"],
    11: ["gibbshall", "Gibbs Hall"],
    12: ["engelhardthall", "Engelhardt Hall"],
    13: ["congrevehall", "Congreve Hall"],
    14: ["fairchildhall", "Fairchild Hall"],
    15: ["adamstower", "Adams Tower"],
    16: ["hetzelhall", "Hetzel Hall"],
    17: ["hunterhall", "Hunter Hall"],
    18: ["jessiedoehall", "Jessie Doe Hall"],
    19: ["lordhall", "Lord Hall"],
    20: ["mcLaughlinhall", "McLaughlin Hall"],
    21: ["sawyerhall", "Sawyer Hall"],
    22: ["theminis", "The Minis"],
  };
  final databaseReference = Firestore.instance;
  Future<Map> getData(List<String> hallselected) async {
    print("here");
    _saveSelection(hallselected);
    var result;
    await databaseReference
        .collection("halls")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => result = f.data);
    });

    print(result["name"]);
    return result;
  }

  String processString(String s) {
    return s.toLowerCase().trim().replaceAll(new RegExp(r"\s+\b|\b\s"), "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0044bb),
        elevation: 8,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Select Your Hall",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
            child: ListView.builder(
                itemCount: halls.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      halls[index][1],
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () => {
                      //print("This2 is my hall: " + halls[index].toString()),
                      getData(halls[index]),
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) =>
                                HomePage(hall: halls[index]),
                          ),
                          (e) => false)
                    }, //push hall index too
                  );
                })),
      ),
      bottomNavigationBar: CustomFooter(),
    );
  }

  _saveSelection(List<String> hall) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'hall_selected';
    final value = hall;
    prefs.setStringList(key, value);
    print('saved $value');
  }
}

class Dosmt extends StatelessWidget {
  const Dosmt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("me"),
    );
  }
}
