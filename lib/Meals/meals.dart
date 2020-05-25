import 'dart:convert';

List<Meals> mealsFromJson(String str) => List<Meals>.from(json.decode(str).map((x) => Meals.fromMap(x)));

String mealsToJson(List<Meals> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Meals {
  String mId;
  String name;
  String price;
  String picture;

  Meals({
    this.mId,
    this.name,
    this.price,
    this.picture,
  });

  factory Meals.fromMap(Map<String, dynamic> json) => Meals(
    mId: json["mId"],
    name: json["name"],
    price: json["price"],
    picture: json["picture"],
  );

  Map<String, dynamic> toMap() => {
    "mId": mId,
    "name": name,
    "price": price,
    "picture": picture,
  };
}