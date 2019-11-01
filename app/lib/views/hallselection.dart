import 'dart:collection';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:dormshub/custom/custom_footer.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:dormshub/views/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HallSelectionPage extends StatefulWidget {
  HallSelectionPage({Key key}) : super(key: key);

  @override
  _HallSelectionPageState createState() => _HallSelectionPageState();
}

class _HallSelectionPageState extends State<HallSelectionPage> {
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
  final databaseReference = Firestore.instance;
  Future<Map> getData(String hallselected) async {
    print("here");
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
                      halls[index],
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () => {
                      getData(halls[index]),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(hall: halls[index])))
                    }, //push hall index too
                  );
                })),
      ),
      bottomNavigationBar: CustomFooter(),
    );
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
