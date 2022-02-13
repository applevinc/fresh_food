import 'package:fresh_food_ui/src/presentation/search/data/data_sources/remote_data_source.dart';
import 'package:fresh_food_ui/src/presentation/search/domain/entities/search_result_entity.dart';
import 'package:fresh_food_ui/src/presentation/search/domain/repositories/search_result_repository.dart';

class SearchResultRepositoryImpl implements ISearchResultRepository {
  final ISearchResultRemoteDataSource? searchResultRemoteDataSource;

  SearchResultRepositoryImpl({required this.searchResultRemoteDataSource});

  @override
  Future<List<SearchResultEntity>> fetchProduct(String? query) async {
    try {
      return await searchResultRemoteDataSource!.fetchProduct(query);
    } catch (e) {
      rethrow;
    }
  }
}
