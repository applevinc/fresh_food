import 'package:fresh_food_ui/src/search/data/data_sources/mock_data_source.dart';
import 'package:fresh_food_ui/src/search/data/data_sources/remote_data_source.dart';
import 'package:fresh_food_ui/src/search/data/repositories/search_result_repository_impl.dart';
import 'package:fresh_food_ui/src/search/domain/repositories/search_result_repository.dart';
import 'package:fresh_food_ui/src/search/domain/usecases/fetch_product_usecase.dart';
import 'package:fresh_food_ui/src/search/view/controllers/search_controller.dart';
import 'package:get_it/get_it.dart';

final GetIt backend = GetIt.instance;

void init() {
  // features
  // - controllers
  backend.registerFactory(() => SearchController(backend()));

  // - usecases
  backend.registerLazySingleton(
      () => FetchSearchResultUseCase(searchResultRepository: backend()));

  // - repository
  backend.registerLazySingleton<ISearchResultRepository>(
      () => SearchResultRepositoryImpl(searchResultRemoteDataSource: backend()));

  // - data sources
  backend.registerLazySingleton<ISearchResultRemoteDataSource>(
      () => MockSearchResultRemoteDataSourceImpl());

  // core

  // external
}
