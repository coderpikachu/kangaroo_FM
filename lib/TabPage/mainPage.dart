import 'package:flutter/material.dart';
import 'package:mysqltest/Data/user-data.dart';
import 'package:mysqltest/Model/user.dart';
import 'package:provider/provider.dart';
import 'homePage.dart';
import 'orderPage.dart';
import 'myPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserData>(context, listen: false).getUser(User(
      uId: '1',
      name: 'a',
      telephone: ''
          '16636185235',
      address: '6-503',
      consumption: 0,
      firstDate: DateTime(2001, 4, 5),
      lastDate: DateTime(2001, 4, 5),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: <Widget>[
            HomePage(),
            OrderPage(),
            MyPage(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                color: Colors.amberAccent,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.assignment,
                color: Colors.amberAccent,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.account_circle,
                color: Colors.amberAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
