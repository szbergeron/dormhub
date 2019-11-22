import 'package:dormshub/views/socials/details.dart';
import 'package:flutter/material.dart';
import '../../model/social.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';

class Socials extends StatefulWidget {
  List<String> hall = [];
  Socials({this.hall});

  _SocialsState createState() => _SocialsState(hall: this.hall);
}

class _SocialsState extends State<Socials> {
  List<String> hall = [];
  _SocialsState({this.hall});
  
  @override
  Widget build(BuildContext context) {
    final refStream = Firestore.instance
          .collection("halls")
          .document(hall[0])
          .collection("socials")
          .where('date', isGreaterThanOrEqualTo: DateTime.now().toString())
          .snapshots();
    //print("hall: "+ this.hall);
    return Container(
        // padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
      stream: refStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return new CardSocial(
                    social: Social(
                        name: document['name'],
                        description: document['description'],
                        date: document['date'],
                        location: document['location'],
                        img: document['img']));
              }).toList(),
            );
        }
      },
    ));
  }
}

class CardSocial extends StatelessWidget {
  final Social social;
  CardSocial({this.social});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,

      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),

      child: Container(
        //decoration: BoxDecoration(// LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft, stops: [0.1,0.6,0.9],
        //              /*colors: [Colors.cyan,Colors.blue,Colors.blue])*/borderRadius: BorderRadius.circular(15)),
        child: ListTileSocial(social: social),
      ),
    );
  }
}

class ListTileSocial extends StatelessWidget {
  final Social social;

  ListTileSocial({this.social});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () =>
         Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return Details(social: social);
            })),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
            padding: EdgeInsets.only(right: 8.0),
            decoration: new BoxDecoration(
              border: new Border(
                  //right: new BorderSide(width: 1.0, ))),
                  ),
            ),
            child: Column(
              children: <Widget>[
                Text(
                  processMonth(social.date),
                  style: TextStyle(fontWeight: FontWeight.w100, fontSize: 15),
                ),
                Text(
                  processDate(social.date),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ],
            )),
        title: Text(
          social.name,
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle:
            //Icon(Icons.description, color: Colors.yellowAccent),
            Text(social.description),
        trailing: Icon(Icons.keyboard_arrow_right, size: 30.0));
  }

  String processMonth(String date) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat("y-M-d HH:MM").format(now);
    String day = date.substring(8, 10);
    String monthz = date.substring(5, 7);
    String year = date.substring(0, 4);
    String hour = date.substring(11, 13);
    String minute = date.substring(14, 16);
    var parsedDate = DateTime.parse(date);
    String month = DateFormat("MMM").format(parsedDate);
    return month.toUpperCase();
  }

  String processDate(String date) {
    var parsedDate = DateTime.parse(date);
    String month = DateFormat("d").format(parsedDate);
    return month.toUpperCase();
  }
}
