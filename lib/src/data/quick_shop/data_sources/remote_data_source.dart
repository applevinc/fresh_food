import 'package:fresh_food_ui/src/data/quick_shop/models/shop_item_model.dart';

abstract class IShopRemoteDataSource {
  Future<List<ShopItemModel>> fetchFruitItems();
}

class ShopRemoteDataSourceImpl implements IShopRemoteDataSource {
  @override
  Future<List<ShopItemModel>> fetchFruitItems() {
    // implement fetchFruitItems
    throw UnimplementedError();
  }
}
