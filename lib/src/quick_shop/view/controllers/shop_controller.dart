import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/entities/shop_item_entity.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/usecases/add_shop_items_to_cart_usecase.dart';

class ShopController extends ChangeNotifier {
  final AddShopItemsToCartUseCase _addShopItemsToCartUseCase;

  List<ShopItemEntity> _fruitItems = [];
  List<ShopItemEntity> _store = [];

  ShopController(this._addShopItemsToCartUseCase);

  void addItemsToCart() {
    _addShopItemsToCartUseCase.addItemsToCart(_fruitItems);
  }

  void add(ShopItemEntity item) {
    if (_fruitItems.isEmpty) {
      item.count++;
      _fruitItems.add(item);
      notifyListeners();
    } else {
      List<ShopItemEntity> copyOfFruitCart = _fruitItems;

      if (_exist(item, copyOfFruitCart)) {
        item.count++;
        notifyListeners();
      } else {
        item.count++;
        _fruitItems.add(item);
        notifyListeners();
      }
    }
  }

  void remove(ShopItemEntity item) {
    for (int i = 0; i < _fruitItems.length; i++) {
      if (_fruitItems[i].name == item.name) {
        if (item.count == 0) {
          item.count = 0;
          _fruitItems.removeAt(i);
          notifyListeners();
          break;
        } else {
          item.count--;
          notifyListeners();
          break;
        }
      }
    }
  }

  void refresh() {
    for (var item in _store) {
      item.count = 0;
    }
    notifyListeners();
  }

  bool _exist(ShopItemEntity item, List<ShopItemEntity> cart) {
    for (int i = 0; i < cart.length; i++) {
      if (cart[i].name == item.name) {
        return true;
      }
    }
    return false;
  }
}
