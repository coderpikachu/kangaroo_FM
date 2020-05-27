import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysqltest/Authentic/phone.dart';
import 'package:mysqltest/Data/meal-data.dart';
import 'package:provider/provider.dart';
import 'Authentic/signup.dart';
import 'Data/order-without-user-info-data.dart';
import 'Data/user-data.dart';
import 'TabPage/mainPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MealData(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserData(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderWithoutUserInfoData(),
        ),
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    ),
  );
}
