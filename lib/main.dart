import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysqltest/Data/meal-data.dart';
import 'package:mysqltest/Screen/Authentic/Welcome/welcome_page.dart';
import 'package:provider/provider.dart';
import 'Data/order-without-user-info-data.dart';
import 'Data/user-data.dart';
import 'Screen/TabPage/main-page.dart';

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
        home: WelcomePage(),
      ),
    ),
  );
}
