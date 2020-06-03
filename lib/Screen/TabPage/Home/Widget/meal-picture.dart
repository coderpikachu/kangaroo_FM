import 'package:flutter/material.dart';
import 'package:mysqltest/Model/meal.dart';
import 'package:mysqltest/Screen/Detail/detail-page.dart';

import '../../../../constants.dart';

class MealPicture extends StatefulWidget {
  final Meal meal;
  MealPicture({this.meal});
  @override
  _MealPictureState createState() => _MealPictureState();
}

class _MealPictureState extends State<MealPicture> {
  @override
  Widget build(BuildContext context) {
    final Meal meal = this.widget.meal;
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.13),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        child: Image.asset(
          'assets/images/${meal.picture}',
          width: 150,
          height: 150,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(index: meal.mId),
            ),
          );
        },
      ),
    );
  }
}
