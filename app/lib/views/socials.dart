import 'package:flutter/material.dart';
import '../model/social.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Socials extends StatefulWidget {
  Socials({Key key}) : super(key: key);

  _SocialsState createState() => _SocialsState();
}


List getSocials(){
  return [Social(title: "Eating with Joey",description: "We will make a cake in the kitchen"),Social(title: "Baking with Abby",description: "We will make a cake in the kitchen"),
  Social(title: "Coding with Nick",description: "We will make a cake in the kitchen"),
  Social(title: "Runningg with Ruthie",description: "We will make a cake in the kitchen"),
  Social(title: "Painting with Julia",description: "We will make a cake in the kitchen"),
  Social(title: "Movie with Kaley",description: "We will make a cake in the kitchen"),
  Social(title: "Dancing with Gordon",description: "We will make a cake in the kitchen"),];
  
  
}
final socials= getSocials().toList();
class _SocialsState extends State<Socials> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: Firestore.instance.collection("halls")
                .document("Hubbard Hall")
                .collection("socials")
                //.getDocuments(.getDocuments()
              .snapshots(),
            builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error: ${snapshot.error}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new Text('Loading...');
                  default:
                    return new ListView(
                      children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                          return new CardSocial(social:
                          Social(title: document['name'], description: document['description'], date:document['date'])
                            
                          );
                      }).toList(),
                    );
                }
              },
            ));
  }
}
class CardSocial extends StatelessWidget {
  

  final Social social;
  CardSocial({this.social});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      
      child: Container(
        decoration: BoxDecoration(// LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft, stops: [0.1,0.6,0.9],
                      /*colors: [Colors.cyan,Colors.blue,Colors.blue])*/borderRadius: BorderRadius.circular(15)),
        child: ListTileSocial(social:social),
      ),
    );
  }
}

class ListTileSocial extends StatelessWidget {
  final Social social;

  ListTileSocial({this.social});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      
         contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        leading: Container(
          padding: EdgeInsets.only(right: 8.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, ))),
          child: Text(
         social.date,
          style: TextStyle( fontWeight: FontWeight.bold,fontSize: 20),
        )),
        title: Text(
         social.title,
          style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold,fontSize: 20),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: 
            //Icon(Icons.description, color: Colors.yellowAccent),
            Text(social.description)
          
        ,
        trailing:
            Icon(Icons.keyboard_arrow_right, size: 30.0));
  }
}
     