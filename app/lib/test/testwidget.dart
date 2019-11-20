import 'package:dormshub/custom/story_card.dart';
import 'package:dormshub/model/social.dart';
import 'package:dormshub/views/socials/details.dart';
import 'package:dormshub/views/socials/socials.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';

class FirestoreSlideshow extends StatefulWidget {
  String hall = "";
  FirestoreSlideshow({this.hall});
  createState() => FirestoreSlideshowState(hall: this.hall);
}

class FirestoreSlideshowState extends State<FirestoreSlideshow> {
  final PageController ctrl = PageController(viewportFraction: 0.8);

  final Firestore db = Firestore.instance;
  Stream slides;
  String hall;
  FirestoreSlideshowState({this.hall});

  String activeTag = 'favorites';

  // Keep track of current page to avoid unnecessary renders
  int currentPage = 0;

  @override
  void initState() {
    _queryDb();

    // Set state when page changes
    ctrl.addListener(() {
      int next = ctrl.page.round();

      if (currentPage != next) {
        setState(() {
          currentPage = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
     Hero(
        tag: "eventDetail",child:StreamBuilder(
        stream: slides,
        initialData: [],
        builder: (context, AsyncSnapshot snap) {
          List slideList = snap.data.toList();

          return PageView.builder(
              controller: ctrl,
              itemCount: slideList.length + 1,
              itemBuilder: (context, int currentIdx) {
                if (currentIdx == 0) {
                  return _buildTagPage();
                } else if (slideList.length >= currentIdx) {
                  // Active page
                  bool active = currentIdx == currentPage;
                  return _buildStoryPage(slideList[currentIdx - 1], active);
                }
              });
        }),);
  }

  Stream _queryDb() {
    final refStream = Firestore.instance
        .collection("halls")
        .document(hall)
        .collection("socials")
        .where('date', isGreaterThanOrEqualTo: DateTime.now().toString())
        .snapshots();

    // Make a Query

    // Map the documents to the data payload
    slides = refStream.map((list) => list.documents.map((doc) => doc.data));

    // Update the active tag
  }

  // Builder Functions

  _buildStoryPage(Map data, bool active) {
    // Animated Properties
    final double blur = active ? 30 : 0;
    final double offset = active ? 20 : 0;
    final double top = active ? 100 : 200;

    final social = Social(
        name: data['name'],
        description: data['description'],
        date: data['date'],
        location: data['location'],
        img: data['img']);

    return AnimatedContainer(
       duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 50, right: 30),
      decoration: BoxDecoration(),
     
     
      
        child: GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Details(
                        social: social,
                      ))),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: social.img,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black87,
                          blurRadius: blur,
                          offset: Offset(offset, offset))
                    ],
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              Center(
                  child: Text(social.name,
                      style: TextStyle(fontSize: 40, color: Colors.white))),
            ],
          ),
        ),
      
      
    );
  }

  _buildTagPage() {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Stories',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        Text('FILTER', style: TextStyle(color: Colors.black26)),
        _buildButton('favorites'),
        _buildButton('happy'),
        _buildButton('sad')
      ],
    ));
  }

  _buildButton(tag) {
    Color color = tag == activeTag ? Colors.purple : Colors.white;
    return FlatButton(
        color: color, child: Text('#$tag'), onPressed: () => _queryDb());
  }
}
