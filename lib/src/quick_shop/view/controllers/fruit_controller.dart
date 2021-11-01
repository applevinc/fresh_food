import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/entities/shop_item_entity.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/usecases/add_shop_items_to_cart_usecase.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/usecases/fetch_fruit_items_usecase.dart';
import 'package:fresh_food_ui/src/quick_shop/view/controllers/shop_controller.dart';

class FruitShopController extends ShopController {
  List<ShopItemEntity> _fruitItems = [];

  FruitShopController(AddShopItemsToCartUseCase addShopItemsToCartUseCase) : super(addShopItemsToCartUseCase);

  List<ShopItemEntity> get items => _fruitItems;
}

class FruitStoreController extends ChangeNotifier {
  final FetchFruitItemsUseCase _fetchFruitItemsUseCase;

  FruitStoreController(this._fetchFruitItemsUseCase);

  List<ShopItemEntity> _items = [];
  List<ShopItemEntity> get items => _items;

  Future<List<ShopItemEntity>> fetch() async {
    _items = await _fetchFruitItemsUseCase.call();
    return _items;
  }
}
