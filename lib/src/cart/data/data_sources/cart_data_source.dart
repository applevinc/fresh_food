import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';

abstract class ICartDataSource {
  Future<List<CartEntity>> addItemsToCart();
}

class CartDataSourceImpl implements ICartDataSource {
  @override
  Future<List<CartEntity>> addItemsToCart() {
    throw UnimplementedError();
  }
}
