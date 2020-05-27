// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromMap(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Order {
  String oId;
  double consumption;
  String arriveTime;
  String orderTime;
  DateTime date;
  String mIdId;
  String uIdId;

  Order({
    this.oId,
    this.consumption,
    this.arriveTime,
    this.orderTime,
    this.date,
    this.mIdId,
    this.uIdId,
  });

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        oId: json["oId"],
        consumption: json["consumption"],
        arriveTime: json["ArriveTime"],
        orderTime: json["OrderTime"],
        date: DateTime.parse(json["date"]),
        mIdId: json["mId_id"],
        uIdId: json["uId_id"],
      );

  Map<String, dynamic> toMap() => {
        "oId": oId,
        "consumption": consumption,
        "ArriveTime": arriveTime,
        "OrderTime": orderTime,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "mId_id": mIdId,
        "uId_id": uIdId,
      };
}
