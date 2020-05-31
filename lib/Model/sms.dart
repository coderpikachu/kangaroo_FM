// To parse this JSON data, do
//
//     final sms = smsFromJson(jsonString);

import 'dart:convert';

List<Sms> smsFromJson(String str) =>
    List<Sms>.from(json.decode(str).map((x) => Sms.fromMap(x)));

String smsToJson(List<Sms> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Sms {
  String telephone;
  String code;

  Sms({
    this.telephone,
    this.code,
  });

  factory Sms.fromMap(Map<String, dynamic> json) => Sms(
        telephone: json["telephone"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "telephone": telephone,
        "code": code,
      };
}
