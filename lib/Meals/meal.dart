import 'dart:convert';

List<Meal> mealsFromJson(String str) =>
    List<Meal>.from(json.decode(str).map((x) => Meal.fromMap(x)));

String mealsToJson(List<Meal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Meal {
  String mId;
  String name;
  String price;
  String picture;

  Meal({
    this.mId,
    this.name,
    this.price,
    this.picture,
  });

  factory Meal.fromMap(Map<String, dynamic> json) => Meal(
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
