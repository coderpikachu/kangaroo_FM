import 'package:flutter/cupertino.dart';
import 'package:mysqltest/Data/meal-data.dart';
import '../Model/meal.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<List<Meal>> fetchMeal(BuildContext context) async {
  String url = "http://10.0.2.2/Model/meals.php";
  final response = await http.post(url, body: {'action': "GET_ALL"});
  final List<Meal> mealsList = mealFromJson(response.body);
  Provider.of<MealData>(context, listen: false).getMIdToMeal(mealsList);
  return mealsList;
}
