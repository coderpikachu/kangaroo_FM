import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Authentic/login.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kangaroo'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 0),
        child: ListView(
          children: <Widget>[
            GestureDetector(
              child: CircleAvatar(
                radius: 150,
                backgroundImage: Image.asset(
                  'images/1.jpg',
                ).image,
              ),
              onTap: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text('手机号2'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text('地址'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text('修改密码'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text('联系客服'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text('关于我们'),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 160,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Colors.redAccent,
                    child: Text(
                      'Log Out',
                    ),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
