import 'package:dormshub/views/admin/admin_login.dart';
import 'package:flutter/material.dart';
import 'package:dormshub/custom/custom_footer.dart';
import 'package:dormshub/login.dart';
import 'package:dormshub/model/social.dart';
import 'package:dormshub/register.dart';
import 'package:dormshub/views/hallselection.dart';
import 'package:dormshub/views/home.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double _width = 300;
  bool _animOP = false;
  bool _animOP2 = false;
  bool _animOP3 = false;
  double _heigth = 300;
  String _animationName = "animate";
  void _loadEarth() {
    setState(() {
      // _events = result["name"];
      _animationName = "animate";
    });
  }

  void _animOpacity() {
    setState(() {
      // _events = result["name"];
      _animOP = true;
      _animOP2 = true;
      _animOP3 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
   

     _readHallPreference().then((value) {
       if(value!=null)
       {
         
       
       print("awijdwoaawkdijawoijdadaijd");
      Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(
                          builder: (context) => HomePage(hall: value),
                        ), (e) => false);
    }});
   
    if (MediaQuery.of(context).size.width < 410) {
      _width = 150;
      _heigth = 150;
    }
    _animOpacity();

    return Container(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 8,
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     children: <Widget>[
        //       Text(
        //         "DormHub",
        //         style: TextStyle(color: Colors.blue),
        //       ),
        //     ],
        //   ),
        // ),
        body: Column(
          children: <Widget>[
            Center(
                child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 100, 25, 25),
                  child: Container(
                    child: FlareActor(
                      'assets/anim/mydorm.flr',
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      animation: _animationName,
                    ),
                    width: _width,
                    height: _heigth,
                  ),
                  // child: Image.asset(
                  //   "assets/imgs/logo.png",

                  //   width: _width,
                  //   height: _heigth,
                  //   fit: BoxFit.contain,
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      "Choose a campus:",
                      style: TextStyle(
                        color: Color(0xff0044bb),
                        fontSize: 23,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                DropDownButton(),
                Padding(
                  padding: EdgeInsets.all(70),
                ),
                MaterialButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HallSelectionPage(),
                    ),
                  ),
                  minWidth: 100,
                  height: 40,
                  color: Color(0xff0044bb),
                  textColor: Colors.white,
                  child: Text("Continue"),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Admin Login",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AdminLogin(),
                        )))
              ],
            )

                // <-- Built with StreamBuilder
                // <-- Built with StatefulWidget
                ),
          ],
        ),
        bottomNavigationBar: CustomFooter(),
      ),
    );
  }
   Future<String>_readHallPreference() async {
        final prefs = await SharedPreferences.getInstance();
        final key = 'hall_selected';
        final value = prefs.getString(key);
        if(value == null || value == "")
        {
          return null;
        }

        
         return value;
      }
}

class DropDownButton extends StatefulWidget {
  @override
  _DropDownButtonState createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  String dropdownValue = 'UNH - Durham';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.blueAccent,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.blue),
        underline: Container(
          height: 2,
          color: Colors.blue,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['UNH - Durham', 'UNH - Manchester', 'UNH - Concord']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: 20),
            ),
          );
        }).toList(),
      ),
    );
  }

 
}
// class ListOfColleges extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: ListView.builder(
//           itemCount: 100,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => Login(),
//                   ),
//                 );
//               },
//               child: Container(
//                 padding: EdgeInsets.all(16.0),
//                 child: Text('Item #$index'),
//                 color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
//               ),
//             );
//           }),
//     );
//   }
// }
