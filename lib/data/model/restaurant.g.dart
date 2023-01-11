// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      name: json['name'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      address: json['address'] as String,
      rating: (json['rating'] as num).toDouble(),
      menu: (json['menu'] as List<dynamic>)
          .map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'address': instance.address,
      'rating': instance.rating,
      'menu': instance.menu.map((e) => e.toJson()).toList(),
    };
