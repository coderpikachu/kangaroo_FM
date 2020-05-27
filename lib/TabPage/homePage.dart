import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysqltest/Data/meal-data.dart';
import 'package:mysqltest/Data/order-without-user-info-data.dart';
import 'package:provider/provider.dart';
import '../Detail/detailPage.dart';
import '../Api/meal-api.dart';
import '../Model/meal.dart';

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
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        leading: Image.asset('images/icon.png'),
        backgroundColor: Colors.teal,
        title: Text('kangaroo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Location',
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            tooltip: 'Location',
            onPressed: _openBottomSheet,
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchMeal(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Meal meal = snapshot.data[index];
                  return Row(
                    children: <Widget>[
                      GestureDetector(
                        child: Image.asset(
                          'images/${meal.picture}',
                          width: 200,
                          height: 200,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(index: meal.mId),
                            ),
                          );
                        },
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
                          Text('0'),
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
                      ),
                    ],
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
//        ListView(
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                GestureDetector(
//                  child: Image.asset(
//                    'images/1.jpg',
//                    width: 200,
//                    height: 200,
//                  ),
//                  onTap: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => DetailPage(index: 1),
//                      ),
//                    );
//                  },
//                ),
//                SizedBox(
//                  width: 50,
//                ),
//                Column(
//                  mainAxisAlignment: MainAxisAlignment.end,
//                  children: <Widget>[
//                    Text('fish'),
//                    SizedBox(
//                      height: 30,
//                    ),
//                    Text('0'),
//                    Row(
//                      children: <Widget>[
//                        IconButton(
//                          icon: Icon(Icons.add),
//                          tooltip: 'Location',
//                          onPressed: _openBottomSheet,
//                        ),
//                        IconButton(
//                          icon: Icon(Icons.remove),
//                          tooltip: 'Location',
//                          onPressed: _openBottomSheet,
//                        ),
//                      ],
//                    ),
//                  ],
//                ),
//              ],
//            ),
//          ],
//        ),
      ),
    );
  }
}
