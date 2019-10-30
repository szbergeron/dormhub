import 'package:flutter/material.dart';
import '../model/social.dart';
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
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: socials.length,
        itemBuilder: (BuildContext context, int index) {
          return CardSocial(social:socials[index]);
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
      elevation: 8.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft, stops: [0.1,0.6,0.9],
                      colors: [Colors.cyan,Colors.blue,Colors.blue]),borderRadius: BorderRadius.circular(15)),
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
          padding: EdgeInsets.only(right: 12.0),
          decoration: new BoxDecoration(
              border: new Border(
                  right: new BorderSide(width: 1.0, color: Colors.white))),
          child: Icon(Icons.favorite, color: Colors.white),
        ),
        title: Text(
         social.title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

        subtitle: Row(
          children: <Widget>[
            Icon(Icons.linear_scale, color: Colors.yellowAccent),
            Text(" " + social.description, style: TextStyle(color: Colors.white))
          ],
        ),
        trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));
  }
}
     