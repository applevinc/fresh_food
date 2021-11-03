import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';
import 'package:fresh_food_ui/src/core/global/product_entity.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/entities/shop_item_entity.dart';

import 'package:tuple/tuple.dart';

class CartController extends ChangeNotifier {
  List<CartEntity> _items = [];
  int _total = 0;

  List<CartEntity> get items => _items;
  int get total => _total;

  void addItem(ProductEntity product) {
    _items.add(product);
    notifyListeners();
  }

  void addShop(List<ShopItemEntity> shopItems) {
    for (var item in shopItems) {
      // check if item is already in cart
      var e = _exist(item);
      if (e.item1) {
        // increase count
        _items[e.item2].qty = _items[e.item2].qty + item.qty;
      } else {
        _items.add(_createCartEntity(item));
      }
    }
    _calcTotal();
    notifyListeners();
  }

  void _calcTotal() {
    _total = 0;
    for (var item in _items) {
      _total = _total + item.qty;
    }
  }

  CartEntity _createCartEntity(ShopItemEntity item) {
    return CartEntity(
      name: item.name,
      img: item.img,
      price: item.price,
      qty: item.qty,
    );
  }

  Tuple2<bool, int> _exist(CartEntity item) {
    for (int i = 0; i < _items.length; i++) {
      if (item.name == _items[i].name) {
        return Tuple2(true, i);
      }
    }

    return Tuple2(false, null);
  }
}
