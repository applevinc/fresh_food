import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';
import 'package:fresh_food_ui/src/cart/domain/repositories/cart_repository.dart';

class FetchProductCartUseCase {
  final ICartRepository _cartRepository;

  FetchProductCartUseCase(this._cartRepository);

  Future<List<CartEntity>> call() async {
    return await _cartRepository.fetchProductCartFromShop();
  }
}
