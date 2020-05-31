import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class SearchBox extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final int lowerBound, upperBound;
  SearchBox({this.onChanged, this.lowerBound, this.upperBound});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: ksecondaryColor.withOpacity(0.32),
              ),
            ),
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Food",
                hintStyle: TextStyle(color: ksecondaryColor),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ksecondaryColor.withOpacity(0.32),
              ),
            ),
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "low",
                hintStyle: TextStyle(color: ksecondaryColor),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ksecondaryColor.withOpacity(0.32),
              ),
            ),
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "up",
                hintStyle: TextStyle(color: ksecondaryColor),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
