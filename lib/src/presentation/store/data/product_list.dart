import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/assets/product_images.dart';
import 'package:fresh_food_ui/src/presentation/store/models/product.dart';

var products = <StoreProduct>[
  StoreProduct(
    name: "Berries",
    img: ProductImages.strawberry,
    bgColor: Color(0xffdd4040),
  ),
  StoreProduct(
    name: "Citrus",
    img: ProductImages.orange_store,
    bgColor: Color(0xffffa700),
  ),
  StoreProduct(
    name: "Banana",
    img: ProductImages.banana,
    bgColor: Color(0xffffd958),
  ),
];