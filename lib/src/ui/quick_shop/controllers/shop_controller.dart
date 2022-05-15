import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/ui/quick_shop/models/shop_item.dart';

class ShopController extends ChangeNotifier {
  List<ShopItem> _allFood = [];
  List<ShopItem> get allFood => _allFood;
  List<ShopItem> _fruits = [];
  List<ShopItem> get fruits => _fruits;
  List<ShopItem> _vegs = [];
  List<ShopItem> get vegs => _vegs;
  List<ShopItem> _nuts = [];
  List<ShopItem> get nuts => _nuts;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchShop() async {}
}
