import 'package:fresh_food_ui/src/domain/quick_shop/entities/shop_item_entity.dart';

abstract class IShopRepository {
  Future<List<ShopItemEntity>> fetchFruitItems();
}
