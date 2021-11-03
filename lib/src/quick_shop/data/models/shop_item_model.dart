import 'package:fresh_food_ui/src/quick_shop/domain/entities/shop_item_entity.dart';

class ShopItemModel extends ShopItemEntity {
  final String name;
  final String img;
  final int price;
  int qty;

  ShopItemModel({
    this.name,
    this.img,
    this.price,
    this.qty,
  });
}
