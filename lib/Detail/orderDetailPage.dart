import 'package:flutter/material.dart';

class OrderDetailPage extends StatefulWidget {
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
      ),
      body: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.asset(
                'images/1.jpg',
                width: 200,
                height: 200,
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('fish'),
                  SizedBox(
                    height: 30,
                  ),
                  Text('0'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
