import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';

class ShopItemEntity extends CartEntity {
  final String name;
  final String img;
  int count = 0;

  ShopItemEntity({
    this.name,
    this.img,
    this.count,
  });
}
