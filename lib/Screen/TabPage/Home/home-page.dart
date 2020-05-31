import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysqltest/Data/meal-data.dart';
import 'package:mysqltest/Data/order-without-user-info-data.dart';
import 'package:mysqltest/Screen/TabPage/Home/Widget/home-body.dart';
import 'package:provider/provider.dart';
import 'Widget/home-app-bar.dart';

class HomePage extends StatefulWidget {
  final user;
  HomePage({this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState.showBottomSheet(
      (BuildContext context) {
        return BottomAppBar(
          child: Container(
            height: 90,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Consumer<MealData>(
              builder: (context, mealData, child) {
                return ListView.builder(
                  itemCount: mealData.mIdCount.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                                '${mealData.mIdToMeal[Provider.of<MealData>(context).mIdCount.keys.elementAt(index)].name}'),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                                '${mealData.mIdCount.values.elementAt(index)}'),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.check),
                          tooltip: 'Location',
                          onPressed: () {
                            Provider.of<OrderWithoutUserInfoData>(context,
                                    listen: false)
                                .addOrderWithoutUserInfo(mealData.mIdCount);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      key: _bottomSheetScaffoldKey,
      appBar: homeAppBar(
        context,
        _openBottomSheet,
      ),
      body: HomeBody(),
    );
  }
}
