import 'package:flutter/material.dart';
import 'package:mysqltest/Data/meal-data.dart';
import 'package:mysqltest/Model/meal.dart';
import 'package:provider/provider.dart';

class MealAction extends StatefulWidget {
  final Meal meal;
  MealAction({this.meal});
  @override
  _MealActionState createState() => _MealActionState();
}

class _MealActionState extends State<MealAction> {
  @override
  Widget build(BuildContext context) {
    final Meal meal = this.widget.meal;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text(
          '${meal.name}',
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(
          height: 30,
        ),
        Text('0'),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                height: 25.0,
                width: 25.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Color(0xFF7A9BEE)),
                child: Center(
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
              ),
            ),
            Text('2',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: 15.0)),
            InkWell(
              onTap: () {},
              child: Container(
                height: 25.0,
                width: 25.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Colors.white),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Color(0xFF7A9BEE),
                    size: 20.0,
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              tooltip: 'Location',
              onPressed: () {
                Provider.of<MealData>(context, listen: false)
                    .changeMIdCount(meal.mId, 1);
              },
            ),
            IconButton(
              icon: Icon(Icons.remove),
              tooltip: 'Location',
              onPressed: () {
                Provider.of<MealData>(context, listen: false)
                    .changeMIdCount(meal.mId, -1);
              },
            ),
          ],
        ),
      ],
    );
  }
}
