import 'package:flutter/material.dart';
import 'package:mysqltest/Screen/TabPage/Home/Widget/search-box.dart';

import 'meal-list.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: SearchBox(
            onChanged: (value) {},
            lowerBound: 1,
            upperBound: 1,
          ),
        ),
        Container(
          height: 450,
          child: MealList(),
        ),
      ],
    );
  }
}
