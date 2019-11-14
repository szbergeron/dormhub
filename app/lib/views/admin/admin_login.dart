import 'package:dormshub/auth/authentication.dart';
import 'package:dormshub/views/admin/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminLogin extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _AdminLoginState createState() => new _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final BaseAuth myauth = new Auth();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  String _errorMessage = "";
  bool _isLoading = false;
  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;

    super.initState();
  }

  void _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    try {
      String userId =
          await myauth.signIn(emailcontroller.text, passwordcontroller.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AdminHome(),
        ),
      );

      setState(() {
        _errorMessage = "Success";
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 100.0,
        child: Image.asset(
          'assets/imgs/hallhub.png',
          width: 500,
          height: 500,
        ),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'hubbard@unh.edu',
      controller: emailcontroller,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      //initialValue: '!Hubbard1',
      obscureText: true,
      controller: passwordcontroller,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        //focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),hoverColor: Colors.green,
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: _validateAndSubmit
        //  () => Navigator.of(context).push(
        //             MaterialPageRoute(
        //               builder: (context) => AdminHome(),
        //             ),
        //           )

        ,
        padding: EdgeInsets.all(12),
        color: Color(0xff0044bb),
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel,
            showErrorMessage(),
            _showCircularProgress(),
          ],
        ),
      ),
    );
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
}
