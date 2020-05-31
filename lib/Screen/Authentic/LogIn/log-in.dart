import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysqltest/Screen/Authentic/sign-up.dart';
import 'package:mysqltest/Screen/TabPage/main-page.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Log In'),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 100,
                    child: Image.asset(
                      'images/logo.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: 250.0,
                  child: TypewriterAnimatedTextKit(
                      speed: Duration(milliseconds: 180),
                      onTap: () {
                        print("Tap Event");
                      },
                      repeatForever: true,
                      text: [
                        "kangaroo",
                      ],
                      textStyle: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: "Agne",
                      ),
                      textAlign: TextAlign.start,
                      alignment:
                          AlignmentDirectional.topStart // or Alignment.topLeft
                      ),
                ),
              ],
            ),
            TextField(),
            TextField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Log In'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                      (route) => route == null,
                    );
                  },
                ),
                SizedBox(
                  width: 50,
                ),
                RaisedButton(
                  child: Text('Sign Up'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUp(),
                      ),
                      (route) => route == null,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
