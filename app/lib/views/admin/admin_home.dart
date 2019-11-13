import 'package:flutter/material.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key key}) : super(key: key);

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
                    "Hubbard Hall",
                    style: TextStyle(color: Colors.white),
                  
                  ),
                ],
              ),
              actions: <Widget>[
                
                IconButton(
                  padding: EdgeInsets.all(5.0),
                  icon: Icon(Icons.add,color: Colors.white,),
                  onPressed: () {
                    // Implement navigation to shopping cart page here...
                    print('Click Message');
                  },
                ),
              ],
            ),
      body: Text("ieodj"),
    );
  }
}