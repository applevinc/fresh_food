import 'package:fresh_food_ui/src/core/assets/product_images.dart';
import 'package:fresh_food_ui/src/data/quick_shop/data_sources/remote_data_source.dart';
import 'package:fresh_food_ui/src/data/quick_shop/models/shop_item_model.dart';


class ShopMockDataSource implements IShopRemoteDataSource {
  @override
  Future<List<ShopItemModel>> fetchFruitItems() async {
    return await Future.value(_items);
  }
}

List<ShopItemModel> _items = [
  ShopItemModel(name: 'Apple', img: ProductImages.apple, qty: 0),
  //ShopItemModel(name: 'Banana', img: ProductImages.banana, count: 0),
  ShopItemModel(name: 'Orange', img: ProductImages.orange_shop, qty: 0),
  ShopItemModel(name: 'Lemon', img: ProductImages.lemon, qty: 0),
  ShopItemModel(name: 'Pear', img: ProductImages.pear_shop, qty: 0),
  ShopItemModel(name: 'Avocado', img: ProductImages.avocado, qty: 0),
  ShopItemModel(name: 'Strawberry', img: ProductImages.strawberry_shop, qty: 0),
  ShopItemModel(name: 'Kiwi', img: ProductImages.kiwi, qty: 0),
  ShopItemModel(name: 'Peach', img: ProductImages.peach, qty: 0),
];
