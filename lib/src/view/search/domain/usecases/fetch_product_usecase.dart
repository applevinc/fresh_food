import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/view/search/domain/entities/search_result_entity.dart';
import 'package:fresh_food_ui/src/view/search/domain/repositories/search_result_repository.dart';

class FetchSearchResultUseCase {
  final ISearchResultRepository searchResultRepository;

  FetchSearchResultUseCase({@required this.searchResultRepository});

  Future<List<SearchResultEntity>> call(String query) async {
    return await searchResultRepository.fetchProduct(query);
  }
}
