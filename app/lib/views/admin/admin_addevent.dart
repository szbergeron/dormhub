import 'package:flutter/material.dart';

class AddEvent extends StatefulWidget {
 

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

   final name = TextEditingController();
  final desc = TextEditingController();
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
              ),),
       body:  Column(
    children: <Widget>[
       ListTile(
        leading: const Icon(Icons.title),
        title:  TextField(
          controller: name,
          decoration:  InputDecoration(
            hintText: "Name of Event",
          ),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.description),
        title:  TextField(
          keyboardType: TextInputType.multiline,
          controller: desc,
          maxLines: 3,
          maxLength: 100,
          decoration:  InputDecoration(
            hintText: "Description",
          ),
        ),
      ),
      ListTile(
        leading: const Icon(Icons.image),
        title:   Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[RaisedButton(
                onPressed: (){},
                child: Text('Choose Image'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: (){},
                child: Text('Upload Image'),
              ),
            ])),
      MaterialButton(
                  onPressed: () => print(name.text),
                  minWidth: 100,
                  height: 40,
                  color: Color(0xff0044bb),
                  textColor: Colors.white,
                  child: Text("Continue"),
                ),
      
    ],
  ),
    );
  }
}