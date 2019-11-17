import 'package:dormshub/test/testwidget.dart';
import 'package:dormshub/views/settings.dart';
import 'package:flutter/material.dart';
// import 'package:unhdorm/buildinglist.dart';
import 'package:dormshub/views/homescreen.dart';
import 'package:dormshub/views/profile.dart';
import 'package:dormshub/views/socials.dart';

class HomePage extends StatefulWidget {
  String hall = "";

  HomePage({this.hall});
  @override
  _HomePageState createState() => _HomePageState(hall);
}


class _HomePageState extends State<HomePage> {
  String  hall;
 _HomePageState(this.hall); 
 

 Widget getPage(){
   if(_myIndex == 0)
   {
     print(hall);
      return HomeScreen(hall: hall,);
   }else if(_myIndex == 2)
   {
    return GiraGira(hall: hall,);
   }
   else
   {
     return _myscreen[_myIndex];
   }
   
 }
  
  int _myIndex = 0;
  final List<Widget> _myscreen = [
    HomeScreen(),
    Socials(),
    GiraGira(),
    Profile(),
  ];
  
  final List<String> _text = [
    "Hubbard Hall",
    "Socials",
    "Events",
    "Profile",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _myIndex = index;
    });
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
                    hall,
                    style: TextStyle(color: Colors.white),
                  
                  ),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(5.0),
                  icon: Icon(Icons.search,color: Colors.white,),
                  onPressed: () {
                    // Implement navigation to shopping cart page here...
                    print('Click Search');
                  },
                ),
                IconButton(
                  padding: EdgeInsets.all(5.0),
                  icon: Icon(Icons.settings,color: Colors.white,),
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SettingsPage()));
                    // Implement navigation to shopping cart page here...
                    print('Click Message');
                  },
                ),
              ],
            ),
      body: getPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
       
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text("Socials")),
          BottomNavigationBarItem(icon: Icon(Icons.event), title: Text("Events")),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Person"),
          )
        ],
        type: BottomNavigationBarType.fixed,
        
        currentIndex: _myIndex,
      ),
    );
  }
}
