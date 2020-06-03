import 'package:flutter/cupertino.dart';
import 'package:mysqltest/Model/user.dart';
import '../../Model/order.dart';
import 'package:http/http.dart' as http;

Future<bool> correctUser(
    BuildContext context, String telephone, String pwd) async {
  try {
    String url = "http://kangaroo-canteen.com/users.php";
//    String sDate =
//        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    final response = await http.post(url, body: {
      'action': "GET_USER",
      'telephone': telephone,
      'pwd': pwd,
    });
    print('addEmployee Response: ${response.body}');
    if (200 == response.statusCode) {
      return userFromMap(response.body).length == 1;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

Future<bool> existUser(BuildContext context, String telephone) async {
  try {
    String url = "http://kangaroo-canteen.com/users.php";
//    String sDate =
//        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    final response = await http.post(url, body: {
      'action': "CHECK_USER",
      'telephone': telephone,
    });
    print('addEmployee Response: ${response.body}');
    if (200 == response.statusCode) {
      return userFromMap(response.body).length == 1;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

Future<List<Order>> fetchUser(BuildContext context) async {
  String url = "http://kangaroo-canteen.com/users.php";
  final response = await http.post(url, body: {'action': "GET_ALL"});
  final userList = orderFromJson(response.body);
  return userList;
}

Future<void> createUser(String telephone, String pwd, String flat,
    String dormitory, BuildContext context) async {
  String url = "http://kangaroo-canteen.com/users.php";
  http.post(url, body: {
    'action': "ADD_USER",
    'uId': telephone,
    'name': pwd,
    'flat': flat,
    'dormitory': dormitory,
    'consumption': '0',
    'firstDate': DateTime(2020, 6, 2),
    'lastDate': DateTime(2020, 6, 2),
  });
}
