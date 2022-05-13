import 'package:fresh_food_ui/src/models/cart.dart';

abstract class CartService {
  Future<List<Cart>> fetchItems();
  Future<void> addToCart(Cart item);
}
