// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromMap(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class User {
  String uId;
  String name;
  String telephone;
  String address;
  double consumption;
  DateTime firstDate;
  DateTime lastDate;

  User({
    this.uId,
    this.name,
    this.telephone,
    this.address,
    this.consumption,
    this.firstDate,
    this.lastDate,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
        uId: json["uId"],
        name: json["name"],
        telephone: json["telephone"],
        address: json["address"],
        consumption: json["consumption"],
        firstDate: DateTime.parse(json["firstDate"]),
        lastDate: DateTime.parse(json["lastDate"]),
      );

  Map<String, dynamic> toMap() => {
        "uId": uId,
        "name": name,
        "telephone": telephone,
        "address": address,
        "consumption": consumption,
        "firstDate":
            "${firstDate.year.toString().padLeft(4, '0')}-${firstDate.month.toString().padLeft(2, '0')}-${firstDate.day.toString().padLeft(2, '0')}",
        "lastDate":
            "${lastDate.year.toString().padLeft(4, '0')}-${lastDate.month.toString().padLeft(2, '0')}-${lastDate.day.toString().padLeft(2, '0')}",
      };
}
