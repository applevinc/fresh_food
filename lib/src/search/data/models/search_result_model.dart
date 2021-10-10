import 'package:fresh_food_ui/src/search/domain/entities/search_result_entity.dart';

class SearchResultModel extends SearchResultEntity {
  final String name;
  final String img;

  SearchResultModel({
    this.name,
    this.img,
  }) : super(img: img, name: name);

  // functions to convert raw data to [SearchResult] object
}
