import 'package:flutter/material.dart';

import '../../../../constants.dart';

AppBar homeAppBar(BuildContext context, openChart) {
  return AppBar(
    leading: Image.asset('assets/images/icon.png'),
    backgroundColor: Colors.teal,
    title: RichText(
      text: TextSpan(
        style: Theme.of(context)
            .textTheme
            .headline6
            .copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: "Kangaroo",
            style: TextStyle(color: ksecondaryColor),
          ),
          TextSpan(
            text: "Food",
            style: TextStyle(color: kPrimaryColor),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.shopping_cart),
        tooltip: 'Location',
        onPressed: openChart,
      ),
    ],
  );
}
