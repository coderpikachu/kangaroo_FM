import 'package:flutter/material.dart';
import 'package:mysqltest/Meals/meal.dart';
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
