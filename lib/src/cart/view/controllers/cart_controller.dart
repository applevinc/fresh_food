import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';
import 'package:fresh_food_ui/src/cart/domain/usecases/fetch_product_cart_usecase.dart';
import 'package:fresh_food_ui/src/core/global/product_entity.dart';

class CartController extends ChangeNotifier {
  final FetchProductCartUseCase _fetchProductCartUseCase;

  CartController(this._fetchProductCartUseCase);

  List<CartEntity> _items = [];
  List<CartEntity> get items => _items;

  Future<List<CartEntity>> fetchShopCart() async {
    _items = await _fetchProductCartUseCase.call();
    return _items;
  }

  void addItem(ProductEntity product) {
    _items.add(product);
    notifyListeners();
  }

  void addItemsFromShop(List<CartEntity> items) {
    _items.addAll(items);
    fetchShopCart();
    notifyListeners();
  }
}
