import 'package:fresh_food_ui/src/search/domain/entities/search_result_entity.dart';

class SearchResultModel extends SearchResultEntity {
  final String name;
  final String img;
  final String description;
  final String storage;
  final String origin;
  final String preparationAndUsage;
  final Map<String, String> nutritionInfo;

  SearchResultModel({
    this.name,
    this.img,
    this.description,
    this.storage,
    this.origin,
    this.preparationAndUsage,
    this.nutritionInfo,
  }) : super(
          img: img,
          name: name,
          description: description,
          storage: storage,
          origin: origin,
          preparationAndUsage: preparationAndUsage,
          nutritionInfo: nutritionInfo,
        );

  // functions to convert raw data to [SearchResult] object
}
