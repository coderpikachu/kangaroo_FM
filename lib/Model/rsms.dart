// To parse this JSON data, do
//
//     final rsms = rsmsFromJson(jsonString);

import 'dart:convert';

List<Rsms> rsmsFromJson(String str) =>
    List<Rsms>.from(json.decode(str).map((x) => Rsms.fromMap(x)));

String rsmsToJson(List<Rsms> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Rsms {
  String telephone;
  String code;
  bool check;

  Rsms({
    this.telephone,
    this.code,
    this.check,
  });

  factory Rsms.fromMap(Map<String, dynamic> json) => Rsms(
        telephone: json["telephone"],
        code: json["code"],
        check: json["check"],
      );

  Map<String, dynamic> toMap() => {
        "telephone": telephone,
        "code": code,
        "check": check,
      };
}
