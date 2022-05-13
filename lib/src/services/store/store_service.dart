import 'package:fresh_food_ui/src/models/food.dart';

abstract class StoreService {
  Future<List<Food>> fetchStore();
  Future<Food> getFeaturedFood();
}
