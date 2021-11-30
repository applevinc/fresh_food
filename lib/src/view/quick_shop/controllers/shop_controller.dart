import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/domain/quick_shop/entities/shop_item_entity.dart';

class ShopController extends ChangeNotifier {
  List<ShopItemEntity> _items = [];

  List<ShopItemEntity> get items => _items;

  void add(ShopItemEntity item) {
    if (_items.isEmpty) {
      item.qty = (item.qty! + 1);
      _items.add(item);
      notifyListeners();
    } else {
      List<ShopItemEntity> copyOfFruitCart = _items;

      if (_exist(item, copyOfFruitCart)) {
        item.qty = (item.qty! + 1);
        notifyListeners();
      } else {
        item.qty = (item.qty! + 1);
        _items.add(item);
        notifyListeners();
      }
    }
  }

  void remove(ShopItemEntity item) {
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].name == item.name) {
        if (item.qty == 0) {
          item.qty = 0;
          _items.removeAt(i);
          notifyListeners();
          break;
        } else {
          item.qty = (item.qty! - 1);
          notifyListeners();
          break;
        }
      }
    }
  }

  void empty() {
    _items = [];
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
