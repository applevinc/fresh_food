import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';
import 'package:fresh_food_ui/src/core/global/product_entity.dart';

class CartController extends ChangeNotifier {
  List<CartEntity> _items = [];
  List<CartEntity> get items => _items;

  void addItem(ProductEntity product) {
    _items.add(product);
    notifyListeners();
  }

  void addShop(List<CartEntity> items) {
    _items = _items + items;
    notifyListeners();
  }
}
