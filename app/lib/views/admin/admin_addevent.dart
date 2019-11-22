import 'package:dormshub/model/social.dart';
import 'package:dormshub/views/admin/image_capture.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../auth/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
class AddEvent extends StatefulWidget {

  BaseAuth user_id;
  AddEvent({this.user_id});
  @override
  _AddEventState createState() => _AddEventState(user_id: this.user_id);
}

class _AddEventState extends State<AddEvent> {
  BaseAuth user_id;
  _AddEventState({this.user_id});
  File file;
  final databaseReference = Firestore.instance;
  final String defaultDate = "Click here to choose a date";

  final name = TextEditingController();
  final desc = TextEditingController();
  final location = TextEditingController();
  String _chooseDate = "Click here to choose a date";
  String imgURL = "";
  bool _unlockedB = false;
  bool _isPaused = true;
  String _animationName = "Untitled";
  String user_hall = "";

Future<String> getUser() async {
  FirebaseUser u =  await user_id.getCurrentUser();
  user_hall = u.email.split("@")[0]; 
  return user_hall;
  
}



  Future<bool> createRecord() async {
 
    
    await getUser().then((a) async
    {
       await databaseReference
        .collection("halls")
        .document(user_hall)
        .collection("socials")
        .add({
      "name": name.text,
      "description": desc.text,
      "date": _chooseDate,
      "img": imgURL,
      "location":location.text,
    });
    return user_hall;

    });
       
    return true;
  }

  Future submit() {}

  Future<String> _pickSaveImage() async {
    File imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
     StorageUploadTask uploadTask;
    StorageReference ref = FirebaseStorage.instance
   
        .ref()
        .child("Hubbard Hall")
        .child('images/${DateTime.now()}.png');
        try {
          uploadTask = ref.putFile(imageFile);
          final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
          final String url = (await downloadUrl.ref.getDownloadURL());
          print(url);
          imgURL = url;
          setState(() {
            _unlockedB = true;
          });

          return url;
          
        } catch (e) {
        }
    
    
    
  }

  String readableDate() {
    if (_chooseDate != "Click here to choose a date") {
      return Jiffy({
        "year": int.parse(_chooseDate.substring(0, 4)),
        "month": int.parse(_chooseDate.substring(5, 7)),
        "day": int.parse(_chooseDate.substring(8, 10)),
        "hour": int.parse(_chooseDate.substring(11, 13)),
        "minutes": int.parse(_chooseDate.substring(14, 16)),
      }).yMMMMEEEEdjm.toString();
    } else {
      return _chooseDate;
    }
  }

  bool constraintValidator() {
    if (name.text == "" ||
        desc.text == "" ||
        // imgURL == "" ||
        location.text == "" ||
        _chooseDate == defaultDate) {
      return false;
    } else {
      return true;
    }
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
              "Add event",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.title),
            title: TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Name of Event",
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.description),
            title: TextField(
              keyboardType: TextInputType.multiline,
              controller: desc,
              maxLines: 3,
              maxLength: 100,
              decoration: InputDecoration(
                hintText: "Description",
              ),
            ),
          ),
          if (_unlockedB != true)
            ListTile(
                leading: const Icon(Icons.image),
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: _pickSaveImage,
                        // onPressed: () => Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             ImageCapture())), //_pickSaveImage,
                        child: Text('Choose Image'),
                      ),
                      SizedBox(width: 10.0),
                      RaisedButton(
                        onPressed: () {},
                        child: Text('Take Picture'),
                      ),
                    ]))
          else
            ListTile(
                leading: const Icon(Icons.image),
                title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Image Uploaded"),
                      Padding(padding: EdgeInsets.all(10)),
                      GestureDetector(
                          onTap: () {
                            imgURL = "";
                            setState(() {
                              _unlockedB = false;
                            });
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ])),
          ListTile(
            leading: const Icon(Icons.my_location),
            title: TextField(
              controller: location,
              decoration: InputDecoration(
                hintText: "Location",
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.date_range),
            title: FlatButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2019, 11, 13, 1, 1, 1),
                      onChanged: (date) {
                    setState(() {
                      _chooseDate = date.toString();
                    });
                  }, onConfirm: (date) {
                    setState(() {
                      _chooseDate = date.toString().substring(0, 16);
                    });
                    print('confirm $date');
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Text(
                  readableDate(),
                  style: TextStyle(color: Color(0xff0044bb)),
                )),
          ),
          MaterialButton(
            onPressed: () {
              if (constraintValidator()) {
                createRecord().then((bool b) {
                  setState(() {
                    _isPaused = false;
                  });

                  Navigator.pop(context);
                });
              } else {
                showAlertDialog(context);
              }
            },
            minWidth: 100,
            height: 40,
            color: Color(0xff0044bb),
            textColor: Colors.white,
            child: Text("Post"),
          ),
          Container(
            child: FlareActor(
              'assets/anim/successcheck.flr',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: _animationName,
              isPaused: _isPaused,
            ),
            width: 300,
            height: 300,
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () => Navigator.pop(context),
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("One more thing left"),
    content: Text("Please complete all fields before posting."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
