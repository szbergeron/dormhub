import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'building.dart';
class BuildingList extends StatelessWidget {
  final List<String> _list = [
    "Hubbard Hall",
    "Haaland Hall",
    "Mills Hall",
    "Handler Hall",
    
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(8.0),
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 5.0,
        children: _list
            .map(
              (data) => 
              
              Hero( 
                tag: data,
                    child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Building(buildingTag: data,))),
                                child: Card(
                    
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                    
                    child: Container(
                      
                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft, stops: [0.1,0.6,0.9],
                      colors: [Colors.cyan,Colors.blue,Colors.blue])),
                                      child: Center(
                          child: Text(
                        data,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
