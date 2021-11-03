import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';

class ShopItemEntity extends CartEntity {
  final String name;
  final String img;
  final int price;
  int qty;

  ShopItemEntity({
    this.name,
    this.img,
    this.price,
    this.qty,
  });
}
