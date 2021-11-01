import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';
import 'package:fresh_food_ui/src/cart/domain/repositories/cart_repository.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/entities/shop_item_entity.dart';

class AddShopItemsToCartUseCase implements ICartRepository {
  List<ShopItemEntity> _items = [];

  @override
  Future<List<CartEntity>> fetchProductCartFromShop() async {
    return await Future.value(_items);
  }

  void addItemsToCart(List<ShopItemEntity> items) {
    _items = items;
  }
}
