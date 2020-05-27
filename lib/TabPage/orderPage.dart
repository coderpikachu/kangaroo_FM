import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mysqltest/Data/order-without-user-info-data.dart';
import 'file:///D:/projects/kangaroo_FM/lib/Api/order-api.dart';
import 'package:provider/provider.dart';

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
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: Provider.of<OrderWithoutUserInfoData>(context)
              .orderWithoutUserInfo
              .length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'images/1.jpg',
                    width: 200,
                    height: 200,
                  ),
                  onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => OrderDetailPage(
//                            mIdCount:
//                                Provider.of<OrderWithoutUserInfoData>(context)
//                                    .orderWithoutUserInfo[index]),
//                      ),
//                    );
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
                          onTap: () {
                            Provider.of<OrderWithoutUserInfoData>(context,
                                    listen: false)
                                .removeOrderWithoutUserInfo(
                                    Provider.of<OrderWithoutUserInfoData>(
                                            context,
                                            listen: false)
                                        .orderWithoutUserInfo[index]);
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Text('Buy'),
                          onTap: () async {
                            postOrder(
                              context,
                              '11111',
                              100.5,
                              '08:00:00',
                              '07:00:00',
                              '2001-04-05',
                              '1',
                              '1',
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
