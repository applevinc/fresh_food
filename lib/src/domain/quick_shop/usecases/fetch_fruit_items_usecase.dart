import 'package:fresh_food_ui/src/domain/quick_shop/entities/shop_item_entity.dart';
import 'package:fresh_food_ui/src/domain/quick_shop/repository/shop_repository.dart';

class FetchFruitItemsUseCase {
  final IShopRepository? _shopRepository;

  FetchFruitItemsUseCase(this._shopRepository);

  Future<List<ShopItemEntity>> call() async {
    return await _shopRepository!.fetchFruitItems();
  }
}
