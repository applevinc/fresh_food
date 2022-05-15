import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/enums/food.dart';
import 'package:fresh_food_ui/src/models/food.dart';

class StoreItem extends Food {
  final Color? backgroundColor;

  StoreItem({
    this.backgroundColor,
    required String name,
    required String imgUrl,
    required String description,
    required String storage,
    required String origin,
    required String usage,
    required FoodType type,
    required List<Nutrient> nutrients,
  }) : super(
          name: name,
          imgUrl: imgUrl,
          description: description,
          storage: storage,
          origin: origin,
          nutrients: nutrients,
          usage: usage,
          type: type,
        );
}
