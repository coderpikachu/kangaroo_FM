import 'package:flutter/material.dart';
import 'package:mysqltest/Data/meal-data.dart';
import 'package:mysqltest/Model/meal.dart';
import 'package:mysqltest/Screen/Detail/detail-page.dart';
import 'package:mysqltest/Screen/TabPage/Home/Widget/meal-picture.dart';
import 'package:provider/provider.dart';

import 'meal-action.dart';

class MealItem extends StatefulWidget {
  final Meal meal;
  MealItem({this.meal});
  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  @override
  Widget build(BuildContext context) {
    final meal = this.widget.meal;
    return Container(
      margin: EdgeInsets.only(left: 20, right: 15, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Color(0xFFB0CCE1).withOpacity(0.32),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                MealPicture(
                  meal: meal,
                ),
                SizedBox(
                  width: 50,
                ),
                MealAction(
                  meal: meal,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
