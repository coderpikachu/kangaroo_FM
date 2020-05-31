import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<String> postRsms(BuildContext context, String telephone) async {
  try {
    String url = "http://10.0.2.2/models/sms.php";
//    String sDate =
//        "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
    final response = await http.post(url, body: {
      'action': "ADD_RSMS",
      'telephone': telephone,
    });
    print('addEmployee Response: ${response.body}');
    if (200 == response.statusCode) {
      return response.body;
    } else {
      return "error";
    }
  } catch (e) {
    return "error";
  }
}

//{
//'action': "ADD_ORDER",
//'oId': '1',
//'consumption': 10,
//'ArriveTime': '08:00:00.000000',
//'OrderTime': '07:00:00.000000',
//'date': '2020-05-11',
//'mId_id': '1',
//'uId_id': '1',
//}
