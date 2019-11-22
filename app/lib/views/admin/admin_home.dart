import 'package:dormshub/views/admin/admin_addevent.dart';
import 'package:dormshub/views/admin/admin_homescreen.dart';
import 'package:dormshub/views/admin/form_page.dart';
import 'package:flutter/material.dart';
import '../../auth/createHallAccounts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dormshub/auth/authentication.dart';
class AdminHome extends StatelessWidget {

 BaseAuth user_id;
 AdminHome({this.user_id});


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
                    "Admin",
                    style: TextStyle(color: Colors.white),
                  
                  ),
                ],
              ),
              actions: <Widget>[
                
                IconButton(
                  padding: EdgeInsets.all(5.0),
                  icon: Icon(Icons.add,color: Colors.white,),
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddEvent(user_id:user_id),
                    ),
                  ),
                ),
              ],
            ),
      body: AdminHomeScreen(user_id:user_id),
    );
  }
}