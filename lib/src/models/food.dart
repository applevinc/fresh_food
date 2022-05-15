import 'package:fresh_food_ui/src/enums/food.dart';

class Food {
  Food({
    required this.name,
    required this.imgUrl,
    required this.description,
    required this.storage,
    required this.origin,
    required this.usage,
    required this.type,
    required this.nutrients,
  });

  final String name;
  final String imgUrl;
  final String description;
  final String storage;
  final String origin;
  final String usage;
  final FoodType type;
  final List<Nutrient> nutrients;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        name: json["name"],
        imgUrl: json["imgUrl"],
        description: json["description"],
        storage: json["storage"],
        origin: json["origin"],
        usage: json["usage"],
        type: json["type"],
        nutrients: List<Nutrient>.from(json["nutrient"].map((x) => Nutrient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imgUrl": imgUrl,
        "description": description,
        "storage": storage,
        "origin": origin,
        "usage": usage,
        "type": type,
        "nutrient": List<dynamic>.from(nutrients.map((x) => x.toJson())),
      };
}

class Nutrient {
  Nutrient({
    required this.title,
    required this.value,
  });

  final String title;
  final int value;

  factory Nutrient.fromJson(Map<String, dynamic> json) => Nutrient(
        title: json["title"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "value": value,
      };
}
