import 'package:flutter/material.dart';
import 'package:mysqltest/Data/user-data.dart';
import 'package:mysqltest/Model/user.dart';
import 'package:provider/provider.dart';
import 'Home/home-page.dart';
import 'Order/order-page.dart';
import 'My/my-page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserData>(context, listen: false).getUser(User(
      uId: '16636185235',
      name: 'SWB1436001',
      flat: '6',
      dormitory: '503',
      consumption: '0',
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
