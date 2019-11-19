import 'package:dormshub/views/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:dormshub/views/intro/welcome.dart';
import 'views/home.dart';
import 'login.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme/themes.dart';
void main()  {
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]).then((_) {
    
    SharedPreferences.getInstance().then((prefs) {
      var darkModeOn = prefs.getBool('darkMode') ?? true;
      runApp(
        ChangeNotifierProvider<ThemeNotifier>(
          builder: (_) => ThemeNotifier(darkModeOn ? darkTheme : lightTheme),
          child: MyApp(),
        ),
      );
    });
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme:  themeNotifier.getTheme(),
      home: IntroductionPage()// HomePage(),
    );
  }
}

