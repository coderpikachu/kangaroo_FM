import 'package:flutter/material.dart';
import 'package:mysqltest/Api/Mysql/rsms-api.dart';
import 'LogIn/log-in.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController codeController = TextEditingController();
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
            TextField(
              controller: codeController,
            ),
            TextField(),
            TextField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Sign Up'),
                  onPressed: () {
                    postRsms(context, '16636185235');
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
                        builder: (context) => LogIn(),
                      ),
                      (route) => route == null,
                    );
                  },
                ),
                SizedBox(
                  width: 50,
                ),
                RaisedButton(
                  child: Text('Check'),
                  onPressed: () async {
//                    String code = await fetchSmsCode(context);
//                    if (code == codeController.text) {
//                      print('correct');
//                    } else {
//                      print('error');
//                    }
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
