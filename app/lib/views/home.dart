import 'package:dormshub/test/testwidget.dart';
import 'package:dormshub/views/settings.dart';
import 'package:flutter/material.dart';
// import 'package:unhdorm/buildinglist.dart';
import 'package:dormshub/views/homescreen.dart';
import 'package:dormshub/views/profile.dart';
import 'package:dormshub/views/socials/socials.dart';
import './calendar/calendar.dart';
class HomePage extends StatefulWidget {
  List<String> hall = [];
  
  HomePage({this.hall});


  
  @override
  _HomePageState createState() => _HomePageState(this.hall);
   
}


class _HomePageState extends State<HomePage> {
  List<String> hall =[];
 _HomePageState(this.hall); 
 

 Widget getPage(){
   if(_myIndex == 0)
   {
     print(hall);
      return HomeScreen(hall: hall,);
   }
   else if(_myIndex == 1)
   {
    return Socials(hall: hall,);
   }else if(_myIndex == 2)
   {
    return CalendarScreen(hall:hall);//FirestoreSlideshow(hall:hall);
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
    FirestoreSlideshow(),
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
               // backgroundColor: Color(0xff0044bb),
                elevation: 8,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    hall[1],
                    //style: TextStyle(color: Colors.white),
                  
                  ),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  padding: EdgeInsets.all(5.0),
                  icon: Icon(Icons.search,),
                  onPressed: () {
                    // Implement navigation to shopping cart page here...
                    print('Click Search');
                  },
                ),
                IconButton(
                  padding: EdgeInsets.all(5.0),
                  icon: Icon(Icons.settings,),
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
            icon: Icon(Icons.book),
            title: Text("News"),
          )
        ],
        type: BottomNavigationBarType.fixed,
        
        currentIndex: _myIndex,
      ),
    );
  }
}
