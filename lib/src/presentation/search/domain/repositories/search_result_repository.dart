import 'package:fresh_food_ui/src/presentation/search/domain/entities/search_result_entity.dart';

abstract class ISearchResultRepository {
  Future<List<SearchResultEntity>> fetchProduct(String? query);
}
