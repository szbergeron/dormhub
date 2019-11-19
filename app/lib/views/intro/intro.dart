import 'package:dormshub/views/home.dart';
import 'package:dormshub/views/intro/welcome.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/introduction_screen.dart' as page;
import 'package:flare_flutter/flare_actor.dart';
import 'package:shared_preferences/shared_preferences.dart';
class IntroductionPage extends StatelessWidget {
  final List<page.PageViewModel> list = [
    PageViewModel(
      title: "Welcome to HallHub",
      body:
          "Here you can explore everything related to your residence hall at your campus:)",
      image: Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Center(
          child: Image.asset("assets/imgs/hallhub.png", height: 205.0),
        ),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        bodyTextStyle: TextStyle(fontSize: 19.0),
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
      ),
    ),
    PageViewModel(
      title: "Attend events and socials",
      body:
          "Never miss a social again! With HallHub all events are there for you",
      image: Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Center(
          child: Image.asset("assets/imgs/welcome2.png", height: 205.0),
        ),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        bodyTextStyle: TextStyle(fontSize: 19.0),
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
      ),
    ),
    
    PageViewModel(
      title: "Build your community",
      body:
          "See what's going on in your building in realtime and make sure to enable notifications",
      image: Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Center(
          child: Image.asset("assets/imgs/welcome3.png", height: 205.0),
        ),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        bodyTextStyle: TextStyle(fontSize: 19.0),
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
      ),
    ),
    PageViewModel(
      title: "Find all information you need",
      body:
          "Get access to all information regarding your engaged space, press 'Done' to start exploring",
      image: Padding(
        padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
        child: Center(
          child: Image.asset("assets/imgs/welcome4.png", height: 205.0),
        ),
      ),
      decoration: const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
        bodyTextStyle: TextStyle(fontSize: 19.0),
        descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        pageColor: Colors.white,
        imagePadding: EdgeInsets.zero,
      ),
    ),
    
  ];

  @override
  Widget build(BuildContext context) {
    _readHallPreference().then((value) {
       if(value!=null)
       {
         
       
    
      Navigator.of(context).pushAndRemoveUntil( MaterialPageRoute(
                          builder: (context) => HomePage(hall: value),
                        ), (e) => false);
    }});
    return IntroductionScreen(
      pages: list,
      onDone:  () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => WelcomeScreen(),
                        )),
      onSkip: () {
        // You can also override onSkip callback
      },
      showSkipButton: true,
      skip: const Text(""),
      next: const Icon(Icons.arrow_forward),
      done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Color(0xff0044bb),
          color: Colors.black26,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0))),
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
