import 'package:fresh_food_ui/src/quick_shop/domain/entities/shop_item_entity.dart';

abstract class IShopRepository {
  Future<List<ShopItemEntity>> fetchFruitItems();
}
