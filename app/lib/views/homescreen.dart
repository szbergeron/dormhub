import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  String hall = "";

  HomeScreen({this.hall});

  @override
  _HomeScreenState createState() => _HomeScreenState(hall: this.hall);
}

class _HomeScreenState extends State<HomeScreen> {
  String hall;
  _HomeScreenState({this.hall});
  int _events = 0;
  

  void getData(myhall) async {
    var result;
    await databaseReference
        .collection("halls")
        .document(myhall)
        .get()
        .then((DocumentSnapshot data) => result = data);
        print(result);
    if (!mounted) {
      return;
    }
    setState(() {
      _events = result["events"];
    });
  }

  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    print(this.hall);
    getData(hall);

    return StaggeredGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12.0,
      mainAxisSpacing: 12.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      children: <Widget>[
        BuildTileM(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Events this week',
                          style: TextStyle(color: Colors.blueAccent)),
                      Text(_events.toString(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 34.0))
                    ],
                  ),
                  Material(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(24.0),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(Icons.timeline,
                            color: Colors.white, size: 30.0),
                      )))
                ]),
          ),
        ),
        BuildTileM(
          onTap: getData,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      color: Colors.red,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child:
                            Icon(Icons.people, color: Colors.white, size: 30.0),
                      )),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text('Community',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                  Text('Images, Videos',
                      style: TextStyle(color: Colors.black45)),
                ]),
          ),
        ),
        BuildTileM(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Material(
                      color: Colors.amber,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(Icons.notifications,
                            color: Colors.white, size: 30.0),
                      )),
                  Padding(padding: EdgeInsets.only(bottom: 16.0)),
                  Text('Notification',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0)),
                  Text('Ping pong tournament ',
                      style: TextStyle(color: Colors.black45)),
                ]),
          ),
        ),
      ],
      staggeredTiles: [
        StaggeredTile.extent(2, 110.0),
        StaggeredTile.extent(1, 180.0),
        StaggeredTile.extent(1, 180.0),
      ],
    );
  }
}

class BuildTileM extends StatelessWidget {
  final Widget child;
  final Function onTap;

  BuildTileM({this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }
}
