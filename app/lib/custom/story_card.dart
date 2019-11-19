import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
class StoryCard extends StatefulWidget {
  StoryController cc;
  StoryCard({this.cc});

  @override
  _StoryCardState createState() => _StoryCardState(cc:cc);
}

class _StoryCardState extends State<StoryCard> {
  StoryController cc;
  _StoryCardState({this.cc});
  
  @override
  Widget build(BuildContext context) {
    return StoryView(
        [
          StoryItem.text(
            "I guess you'd love to see more of our food. That's great.",
            Colors.blue,
          ),
          StoryItem.text(
            "Nice!\n\nTap to continue.",
            Colors.red,
          ),
          StoryItem.pageImage(
            NetworkImage(
                "https://image.ibb.co/cU4WGx/Omotuo-Groundnut-Soup-braperucci-com-1.jpg"),
            caption: "Still sampling",
          ),
          StoryItem.pageGif(
              "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
              caption: "Working with gifs",
              controller: cc),
          StoryItem.pageGif(
            "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side",
            controller: cc,
          ),
          StoryItem.pageGif(
            "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side2",
            controller: cc,
          ),
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: cc,
      );
    
      


     
    
  }
}