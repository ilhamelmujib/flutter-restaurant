import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import 'menu.dart';

part 'restaurant.g.dart';

@JsonSerializable(explicitToJson: true)
class Restaurant {
  final String name;
  final String description;
  final String image;
  final String address;
  final double rating;
  final List<Menu> menu;

  Restaurant({
    required this.name,
    required this.description,
    required this.image,
    required this.address,
    required this.rating,
    required this.menu,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((data) => Restaurant.fromJson(data)).toList();
}
