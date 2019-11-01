import 'package:flutter/material.dart';
import 'package:dormshub/custom/custom_footer.dart';
import 'package:dormshub/login.dart';
import 'package:dormshub/model/social.dart';
import 'package:dormshub/register.dart';
import 'package:dormshub/views/hallselection.dart';
import 'package:dormshub/views/home.dart';

class WelcomeScreen extends StatelessWidget {

  double _width = 300;
  double _heigth = 300;


  @override
  Widget build(BuildContext context) {

    if (MediaQuery.of(context).size.width < 600) {
          _width = 150;
          _heigth = 150;
        } 

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
        body: Center(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 100, 25, 25),
              child: Image.asset(
                "assets/imgs/logo.png",
                
                width: _width,
                height: _heigth,
                fit: BoxFit.contain,
              ),
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
          ],
        )

            // <-- Built with StreamBuilder
            // <-- Built with StatefulWidget
            ),
        bottomNavigationBar: CustomFooter(),
      ),
    );
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
