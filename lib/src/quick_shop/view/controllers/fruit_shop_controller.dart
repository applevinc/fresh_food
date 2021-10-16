import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/entities/shop_item_entity.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/usecases/fetch_fruit_items_usecase.dart';

class FruitShopController extends ChangeNotifier {
  final FetchFruitItemsUseCase _fetchFruitItemsUseCase;
  List<ShopItemEntity> _fruitCart = [];
  List<ShopItemEntity> _fruitItems = [];

  FruitShopController(this._fetchFruitItemsUseCase);

  List<ShopItemEntity> get fruitCart => _fruitCart;
  List<ShopItemEntity> get fruitItems => _fruitItems;

  Future<List<ShopItemEntity>> fetchItems() async {
    _fruitItems = await _fetchFruitItemsUseCase.call();
    return _fruitItems;
  }

  void add(ShopItemEntity fruit) {
    if (_fruitCart.isEmpty) {
      fruit.count++;
      _fruitCart.add(fruit);
      notifyListeners();
    } else {
      List<ShopItemEntity> copyOfFruitCart = _fruitCart;

      if (_exist(fruit, copyOfFruitCart)) {
        fruit.count++;
        notifyListeners();
      } else {
        fruit.count++;
        _fruitCart.add(fruit);
        notifyListeners();
      }
    }
  }

  void remove(ShopItemEntity fruit) {
    for (int i = 0; i < _fruitCart.length; i++) {
      if (_fruitCart[i].name == fruit.name) {
        _fruitCart.removeAt(i);
        notifyListeners();
        break;
      }
    }
  }

  void refresh() {
    for (var item in _fruitItems) {
      item.count = 0;
    }
    notifyListeners();
  }

  bool _exist(ShopItemEntity fruit, List<ShopItemEntity> fruitList) {
    for (int i = 0; i < fruitList.length; i++) {
      if (fruitList[i].name == fruit.name) {
        return true;
      }
    }
    return false;
  }
}
