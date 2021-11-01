import 'package:fresh_food_ui/src/quick_shop/domain/entities/shop_item_entity.dart';

class ShopItemModel extends ShopItemEntity {
  final String name;
  final String img;

  ShopItemModel({
    this.name,
    this.img,
    int price,
    int qty,
  }) : super(price: price, qty: qty);
}
