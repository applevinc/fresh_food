import 'package:fresh_food_ui/src/core/global/product_entity.dart';

class SearchResultEntity extends ProductEntity {
  final String name;
  final String img;

  SearchResultEntity({
    this.name,
    this.img, String description, String storage, String origin, String preparationAndUsage, Map<String, String> nutritionInfo,
  }) : super(img: img, name: name);
}
