import 'package:fresh_food_ui/src/quick_shop/data/models/shop_item_model.dart';

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
