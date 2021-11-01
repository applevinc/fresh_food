import 'package:fresh_food_ui/src/core/global/product_entity.dart';

class CartEntity extends ProductEntity{
  final String name;
  final String img;
  final int price;
  int qty;

  CartEntity({
    this.name,
    this.img,
    this.price,
    this.qty,
  });
}
