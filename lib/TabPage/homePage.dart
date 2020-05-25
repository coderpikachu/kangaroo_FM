import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Detail/detailPage.dart';
import '../Meals/meals-api.dart';
import '../Meals/meals.dart';

class HomePage extends StatefulWidget {
  final user;
  HomePage({this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();

  _openBottomSheet() {
    _bottomSheetScaffoldKey.currentState
        .showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90,
          width: double.infinity,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('fish'),
              Container(
                margin: EdgeInsets.only(right: 0),
                child: GestureDetector(
                  child: Text(this.widget.user.phoneNumber.toString()),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ),
      );
    });
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
          future: fetchMeals(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  Meals meal = snapshot.data[index];
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
                                onPressed: _openBottomSheet,
                              ),
                              IconButton(
                                icon: Icon(Icons.remove),
                                tooltip: 'Location',
                                onPressed: _openBottomSheet,
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
