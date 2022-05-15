import 'package:fresh_food_ui/src/models/food.dart';

abstract class ShopService {
  Future<List<Food>> fetchShop();
}
