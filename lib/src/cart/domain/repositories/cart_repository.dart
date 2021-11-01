import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';

abstract class ICartRepository {
  Future<List<CartEntity>> fetchProductCartFromShop();
}
