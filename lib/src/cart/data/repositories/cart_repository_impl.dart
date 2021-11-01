import 'package:fresh_food_ui/src/cart/data/data_sources/cart_data_source.dart';
import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';
import 'package:fresh_food_ui/src/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements ICartRepository {
  final ICartDataSource _dataSource;

  CartRepositoryImpl({ICartDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<List<CartEntity>> fetchProductCartFromShop() {
    return _dataSource.addItemsToCart();
  }
}
