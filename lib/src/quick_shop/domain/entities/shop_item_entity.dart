import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';

class ShopItemEntity extends CartEntity {
  final String name;
  final String img;

  ShopItemEntity({
    this.name,
    this.img,
    int price,
    int qty,
  }) : super(price: price, qty: qty);
}
