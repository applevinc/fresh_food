import 'package:fresh_food_ui/src/enums/food.dart';
import 'package:fresh_food_ui/src/models/food.dart';

class ShopItem extends Food {
  int count = 0;

  ShopItem({
    required this.count,
    required String name,
    required String imgUrl,
    required FoodType type,
  }) : super(
          name: name,
          imgUrl: imgUrl,
          type: type,
          description: '',
          storage: '',
          origin: '',
          usage: '',
          nutrients: [],
        );
}
