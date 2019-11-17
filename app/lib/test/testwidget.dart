import 'package:dormshub/model/social.dart';
import 'package:dormshub/views/socials.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare_flutter/flare_actor.dart';

class GiraGira extends StatefulWidget {
  String hall = "";

  GiraGira({this.hall});

  @override
  _GiraGiraState createState() => _GiraGiraState(hall: this.hall);
}

class _GiraGiraState extends State<GiraGira> {
  String hall;
  _GiraGiraState({this.hall});
  List<Social> socials;
  bool _doneLoading = false;

  String _animationName = "animate";

  String _events = "";
  void getData(myhall) async {
    var result;
    await databaseReference
        .collection("halls")
        .document(myhall)
        .collection("socials")
        //.getDocuments()
        .getDocuments()
        .then((QuerySnapshot data) {
      data.documents.forEach((f) => createSocial(f.data));
      result = true;
    });
    //     .then((QuerySnapshot snapshot) {
    // snapshot.documents.forEach((f) => print('${f.data}}'));

    //print(result);
    if (!mounted) {
      return;
    }
    setState(() {
      //_events = result["name"];
      _doneLoading = result;
    });
  }

  void _loadEarth() {
    setState(() {
      //_events = result["name"];
      _animationName = "";
    });
  }

  void createSocial(dynamic s) {
    //socials.add(Social(title: s["name"], description: s["description"]));
    _doneLoading = true;
  }

  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    //getData(hall);
    
      return Center(
        child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance
                .collection("halls")
                .document("Hubbard Hall")
                .collection("socials")
                //.getDocuments(.getDocuments()
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return new Text('Loading...');
                default:
                  return new CarouselSlider(
                      height: 400.0,
                      items: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                               // decoration: BoxDecoration(color: Color(0xffdcdedf)),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      document["name"],
                                      style: TextStyle(fontSize: 30.0),
                                    ),
                                  
                                    Image.network(document["img"])
                                  ],
                                ));
                          },
                        );
                      }).toList());
              }
            }),
      );
    
  }
}
