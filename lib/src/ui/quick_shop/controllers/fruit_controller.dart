import 'package:flutter/cupertino.dart';

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
