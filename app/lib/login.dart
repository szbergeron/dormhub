// import 'package:flutter/material.dart';
// import 'package:unhdorm/views/home.dart';
// import 'package:unhdorm/views/homescreen.dart';
// import 'auth/auth.dart';



// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//                 backgroundColor: Colors.white,
//                 elevation: 8,
//               title: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     "DormHub",
//                     style: TextStyle(color: Colors.blue),
                  
//                   ),
//                 ],
//               ),
              
//             ),
//           body: Center(
//                 child: Column(
//                   children: <Widget>[
//                       LoginButton(),
//                       UserProfile() // <-- Built with StreamBuilder
//                       // <-- Built with StatefulWidget
//                   ],
//                 ),
//               ),
//     );
    
    
//   }
// }
// class UserProfile extends StatefulWidget {
//   @override
//   UserProfileState createState() => UserProfileState();
// }

// class UserProfileState extends State<UserProfile> {
//   Map<String, dynamic> _profile;
//   bool _loading = false;

//   @override
//   initState() {
//     super.initState();

//     // Subscriptions are created here
//     authService.profile.listen((state) => setState(() => _profile = state));

//     authService.loading.listen((state) => setState(() => _loading = state));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Container(padding: EdgeInsets.all(20), child: Text(_profile.toString())),
//       Text(_loading.toString())
//     ]);
//   }
// }
// class LoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: authService.user,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {

//             return Column(
//               children: <Widget>[
//                 MaterialButton(
//                   onPressed: () => authService.signOut(),
//                   color: Colors.red,
//                   textColor: Colors.white,
//                   child: Text('Signout'),
//                 ),
//                 MaterialButton(color: Colors.green,
//                   textColor: Colors.white,
//                   child: Text('Go to Home'),onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())),)
//               ],
//             );
//           } else {
//             return MaterialButton(
//               onPressed: () => authService.googleSignIn(),
//               color: Colors.white,
//               textColor: Colors.black,
//               child: Text('Login with Google'),
//             );
//           }
//         });
//   }
// }





