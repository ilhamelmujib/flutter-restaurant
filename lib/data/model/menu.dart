import 'package:json_annotation/json_annotation.dart';

part 'menu.g.dart';

@JsonSerializable()
class Menu {
  String name;
  String image;
  String price;

  Menu({required this.name, required this.image, required this.price});

  factory Menu.fromJson(Map<String, dynamic> json) => _$MenuFromJson(json);

  Map<String, dynamic> toJson() => _$MenuToJson(this);
}
