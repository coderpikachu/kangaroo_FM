import 'package:flutter/cupertino.dart';
import '../Model/order.dart';
import 'package:http/http.dart' as http;

Future<List<Order>> fetchUser(BuildContext context) async {
  String url = "http://10.0.2.2/Model/users.php";
  final response = await http.post(url, body: {'action': "GET_ALL"});
  final userList = orderFromJson(response.body);
  return userList;
}
