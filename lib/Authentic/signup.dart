import 'package:flutter/material.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Sign Up'),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200,
                child: Image.asset(
                  'images/logo.png',
                ),
              ),
            ),
            TextField(),
            TextField(),
            TextField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Sign Up'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                      (route) => route == null,
                    );
                  },
                ),
                SizedBox(
                  width: 50,
                ),
                RaisedButton(
                  child: Text('Log In'),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
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
