import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/global/product_entity.dart';

class StoreProduct extends ProductEntity {
  final String img;
  final String name;
  final Color bgColor;

  StoreProduct({
    this.img,
    this.name,
    this.bgColor,
  });
}

