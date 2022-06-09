import 'package:fresh_food_ui/src/core/assets/product_images.dart';
import 'package:fresh_food_ui/src/enums/food.dart';
import 'package:fresh_food_ui/src/models/food.dart';
import 'package:fresh_food_ui/src/services/store/store_service.dart';

class FakeStoreServiceImpl implements StoreService {
  @override
  Future<List<Food>> fetchStore() async {
    return await Future.value(_store);
  }

  @override
  Future<Food> getFeaturedFood() async {
    return await Future.value(_featuredFood);
  }
}

final _featuredFood = Food(
  name: 'Vegetable',
  imgUrl: FoodImages.broccoli,
  description: 'description',
  storage: 'storage',
  origin: 'origin',
  usage: 'usage',
  type: FoodType.fruit,
  nutrients: [],
);

final _store = [
  Food(
    name: 'Strawberry',
    imgUrl: FoodImages.strawberry_shop,
    description: 'description',
    storage: 'storage',
    origin: 'origin',
    usage: 'usage',
    type: FoodType.fruit,
    nutrients: [],
  ),
  Food(
    name: 'Apple',
    imgUrl: FoodImages.apple,
    description: 'description',
    storage: 'storage',
    origin: 'origin',
    usage: 'usage',
    type: FoodType.fruit,
    nutrients: [],
  ),
  Food(
    name: 'Banana',
    imgUrl: FoodImages.banana,
    description: 'description',
    storage: 'storage',
    origin: 'origin',
    usage: 'usage',
    type: FoodType.fruit,
    nutrients: [],
  ),
  Food(
    name: 'Orange',
    imgUrl: FoodImages.orange_store,
    description: 'description',
    storage: 'storage',
    origin: 'origin',
    usage: 'usage',
    type: FoodType.fruit,
    nutrients: [],
  )
];
