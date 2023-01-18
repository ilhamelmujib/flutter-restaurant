// To parse this JSON data, do
//
//     final restaurantResult = restaurantResultFromJson(jsonString);

import 'dart:convert';

class Restaurant {
  Restaurant({
    this.id,
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.menus,
  });

  String? id;
  String? name;
  String? description;
  String? pictureId;
  String? city;
  double? rating;
  Menus? menus;

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
        menus: Menus.fromJson(json["menus"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "pictureId": pictureId,
        "city": city,
        "rating": rating,
        "menus": menus!.toJson(),
      };
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final parsed = jsonDecode(json);
  return parsed["restaurants"].map<Restaurant>((data) => Restaurant.fromJson(data)).toList();
}


class Menus {
  Menus({
    this.foods,
    this.drinks,
  });

  List<Food?>? foods;
  List<Food?>? drinks;

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: json["foods"] == null
            ? []
            : List<Food?>.from(json["foods"]!.map((x) => Food.fromJson(x))),
        drinks: json["drinks"] == null
            ? []
            : List<Food?>.from(json["drinks"]!.map((x) => Food.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": foods == null
            ? []
            : List<dynamic>.from(foods!.map((x) => x!.toJson())),
        "drinks": drinks == null
            ? []
            : List<dynamic>.from(drinks!.map((x) => x!.toJson())),
      };
}

class Food {
  Food({
    this.name,
  });

  String? name;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
