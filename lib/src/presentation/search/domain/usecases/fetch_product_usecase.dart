import 'package:fresh_food_ui/src/presentation/search/domain/entities/search_result_entity.dart';
import 'package:fresh_food_ui/src/presentation/search/domain/repositories/search_result_repository.dart';

class FetchSearchResultUseCase {
  final ISearchResultRepository? searchResultRepository;

  FetchSearchResultUseCase({required this.searchResultRepository});

  Future<List<SearchResultEntity>> call(String? query) async {
    return await searchResultRepository!.fetchProduct(query);
  }
}
