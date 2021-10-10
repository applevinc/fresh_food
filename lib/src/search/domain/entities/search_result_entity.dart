import 'package:fresh_food_ui/src/core/global/product_entity.dart';

class SearchResultEntity extends ProductEntity {
  final String name;
  final String img;

  SearchResultEntity({
    this.name,
    this.img,
  }) : super(img: img, name: name);
}
