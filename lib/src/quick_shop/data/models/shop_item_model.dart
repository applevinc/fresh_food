import 'package:fresh_food_ui/src/quick_shop/domain/entities/shop_item_entity.dart';

class ShopItemModel extends ShopItemEntity {
  final String name;
  final String img;
  int count = 0;

  ShopItemModel({
    this.name,
    this.img,
    this.count,
  }) : super(name: name, img: img, count: count);
}
