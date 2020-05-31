import 'package:flutter/material.dart';
import 'package:mysqltest/Data/meal-data.dart';
import 'package:mysqltest/Model/meal.dart';
import 'package:provider/provider.dart';

class OrderDetailPage extends StatefulWidget {
  final Map<String, int> mIdCount;
  OrderDetailPage({this.mIdCount});
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Screen.Detail'),
      ),
      body: ListView.builder(
        itemCount: this.widget.mIdCount.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          Meal meal = Provider.of<MealData>(context)
              .mIdToMeal[this.widget.mIdCount.keys.elementAt(index)];
          return Row(
            children: <Widget>[
              GestureDetector(
                child: Image.asset(
                  'images/${meal.picture}',
                  width: 200,
                  height: 200,
                ),
                onTap: () {},
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('${meal.name}'),
                  SizedBox(
                    height: 30,
                  ),
                  Text('${this.widget.mIdCount.values.elementAt(index)}'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
