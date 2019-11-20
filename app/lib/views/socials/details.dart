import 'package:dormshub/model/social.dart';
import 'package:flutter/material.dart';
import 'package:dormshub/views/places.dart';
import 'package:dormshub/views/icon_bagde.dart';
import 'package:intl/intl.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState(social: social);

  Social social;

  Details({this.social});
}

class _DetailsState extends State<Details> {
  Social social;
  _DetailsState({this.social});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        
        title: Text("Social"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications_none,
            ),
            onPressed: () {},
          ),
        ],
        
      ),

      body:ListView(
          children: <Widget>[
           
            Container(
                padding: EdgeInsets.only(left: 0),
                height: 250,
                child: Image.network(
                  social.img,
                ),
            ),
            SizedBox(height: 20),
            ListView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                primary: false,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          social.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.bookmark,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 14,
                        color: Colors.blueGrey[300],
                      ),
                      SizedBox(width: 3),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          social.location,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.blueGrey[300],
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Date",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              parseDate(social.date),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              "Time",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              parseTime(social.date),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      social.description,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
            ),
          ],
        ),
              
      

      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.favorite,
          color: Theme.of(context).canvasColor,
        ),
        onPressed: () {},
      ),

//      bottomNavigationBar: Container(
//        height: 50,
//        child: RaisedButton(
//          elevation: 15,
//          color: Theme.of(context).primaryColor,
//          child: Text(
//            "See Availability",
//            style: TextStyle(
//              color: Theme.of(context).accentColor,
//            ),
//          ),
//          onPressed: (){},
//        ),
//      ),
    );
  }

  String parseDate(String date) {
    var parsedDate = DateTime.parse(date);
    String month = DateFormat("yMMMMEEEEd").format(parsedDate);
    return month;
  }
  String parseTime(String date) {
    var parsedDate = DateTime.parse(date);
    String month = DateFormat("jm").format(parsedDate);
    return month;
  }
}
