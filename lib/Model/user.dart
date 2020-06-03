// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

List<User> userFromMap(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

String userToMap(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class User {
  User({
    this.uId,
    this.name,
    this.flat,
    this.dormitory,
    this.consumption,
    this.firstDate,
    this.lastDate,
  });

  String uId;
  String name;
  String flat;
  String dormitory;
  String consumption;
  DateTime firstDate;
  DateTime lastDate;

  factory User.fromMap(Map<String, dynamic> json) => User(
        uId: json["uId"],
        name: json["name"],
        flat: json["flat"],
        dormitory: json["dormitory"],
        consumption: json["consumption"],
        firstDate: DateTime.parse(json["firstDate"]),
        lastDate: DateTime.parse(json["lastDate"]),
      );

  Map<String, dynamic> toMap() => {
        "uId": uId,
        "name": name,
        "flat": flat,
        "dormitory": dormitory,
        "consumption": consumption,
        "firstDate":
            "${firstDate.year.toString().padLeft(4, '0')}-${firstDate.month.toString().padLeft(2, '0')}-${firstDate.day.toString().padLeft(2, '0')}",
        "lastDate":
            "${lastDate.year.toString().padLeft(4, '0')}-${lastDate.month.toString().padLeft(2, '0')}-${lastDate.day.toString().padLeft(2, '0')}",
      };
}
