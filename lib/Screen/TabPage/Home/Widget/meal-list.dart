import 'package:flutter/material.dart';
import 'package:mysqltest/Api/Mysql/meal-api.dart';
import 'package:mysqltest/Data/meal-data.dart';
import 'package:mysqltest/Model/meal.dart';
import 'package:mysqltest/Screen/Detail/detail-page.dart';
import 'package:provider/provider.dart';

import 'meal-item.dart';

class MealList extends StatefulWidget {
  @override
  _MealListState createState() => _MealListState();
}

class _MealListState extends State<MealList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMeal(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Meal meal = snapshot.data[index];
              return MealItem(
                meal: meal,
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
