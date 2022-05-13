import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/models/cart.dart';

class CartController extends ChangeNotifier {
  List<Cart> _items = [];
  List<Cart> get items => _items;
  int _totalAmount = 0;
  int get totalAmount => _totalAmount;

  void clear() {}
}
