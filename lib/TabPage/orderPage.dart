import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Detail/orderDetailPage.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kangaroo'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'images/1.jpg',
                    width: 200,
                    height: 200,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailPage(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('100 ￥'),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          child: Text('Cancel'),
                          onTap: () {},
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Text('Buy'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
