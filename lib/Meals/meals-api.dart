import 'package:flutter/cupertino.dart';
import 'package:mysqltest/Data/meal-data.dart';
import 'meal.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

Future<List<Meal>> fetchMeals(BuildContext context) async {
  String url = "http://10.0.2.2/products/products.php";
  final response = await http.post(url, body: {'action': "GET_ALL"});
  final mealsList = mealsFromJson(response.body);
  Provider.of<MealData>(context, listen: false).getMIdToMeal(mealsList);
  return mealsList;
}
