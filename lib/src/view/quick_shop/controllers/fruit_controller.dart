import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/domain/quick_shop/entities/shop_item_entity.dart';
import 'package:fresh_food_ui/src/domain/quick_shop/usecases/fetch_fruit_items_usecase.dart';
import 'package:fresh_food_ui/src/view/quick_shop/controllers/shop_controller.dart';

class FruitShopController extends ShopController {}

class FruitStoreController extends ChangeNotifier {
  final FetchFruitItemsUseCase? _fetchFruitItemsUseCase;

  FruitStoreController(this._fetchFruitItemsUseCase);

  List<ShopItemEntity> _store = [];
  List<ShopItemEntity> get items => _store;

  Future<List<ShopItemEntity>> fetch() async {
    _store = await _fetchFruitItemsUseCase!.call();
    return _store;
  }

  void refresh() {
    for (var item in _store) {
      item.qty = 0;
    }
    notifyListeners();
  }
}
