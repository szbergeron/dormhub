import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:dormshub/views/socials/socials.dart';

import '../../model/social.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';

class CalendarScreen extends StatefulWidget {
 

  List<String> hall = [];
  CalendarScreen({this.hall});

  @override
  _CalendarScreenState createState() => _CalendarScreenState(hall:this.hall);
}

class _CalendarScreenState extends State<CalendarScreen> {
   List<String> hall = [];
  _CalendarScreenState({this.hall});
  Stream _refStream;
  bool rebuild = false;

  void handleClicked(DateTime d)
  {
    rebuild = true;
    setState(() {
      print("aiwjdoiawjd");
      print(d);

      
       _refStream = Firestore.instance
          .collection("halls")
          .document(hall[0])
          .collection("socials")
          .where('date', isGreaterThanOrEqualTo: d.toString())
          .snapshots();
      }

    
    );
    
   
  }
  
  @override
  Widget build(BuildContext context) {
    if(!rebuild)
    {
      _refStream = Firestore.instance
          .collection("halls")
          .document(hall[0])
          .collection("socials")
          .where('date', isGreaterThanOrEqualTo: DateTime.now().toString())
          .snapshots();
          print("here2");

    }
     
   
    return Container(
       child: Column(
         children: <Widget>[
           Calendar(onDateSelected: (date) => handleClicked(date),isExpandable: true,),
           Container(
        // padding: const EdgeInsets.all(10.0),
        child: StreamBuilder<QuerySnapshot>(
      stream: _refStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return Expanded(
          child: SizedBox(
            height: 200.0, child:new ListView(
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
            ),),);
        }
      },
    )
    )
         ],
       ),
    );
  }
}

