import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysqltest/Authentic/phone.dart';
import 'package:mysqltest/Data/meal-data.dart';
import 'package:provider/provider.dart';
import 'Authentic/signup.dart';
import 'TabPage/mainPage.dart';

void main() {
  runApp(
    ChangeNotifierProvider<MealData>(
      create: (_) => MealData(),
      child: MaterialApp(
        home: MainPage(),
      ),
    ),
  );
}
