import 'package:fresh_food_ui/src/cart/data/data_sources/cart_data_source.dart';
import 'package:fresh_food_ui/src/cart/data/data_sources/mock_cart_data_source.dart';
import 'package:fresh_food_ui/src/cart/data/repositories/cart_repository_impl.dart';
import 'package:fresh_food_ui/src/cart/domain/repositories/cart_repository.dart';
import 'package:fresh_food_ui/src/cart/domain/usecases/fetch_product_cart_usecase.dart';
import 'package:fresh_food_ui/src/cart/view/controllers/cart_controller.dart';
import 'package:fresh_food_ui/src/quick_shop/data/data_sources/mock_data_source.dart';
import 'package:fresh_food_ui/src/quick_shop/data/data_sources/remote_data_source.dart';
import 'package:fresh_food_ui/src/quick_shop/data/repositories/shop_repository_impl.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/repository/shop_repository.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/usecases/add_shop_items_to_cart_usecase.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/usecases/fetch_fruit_items_usecase.dart';
import 'package:fresh_food_ui/src/quick_shop/view/controllers/fruit_controller.dart';
import 'package:fresh_food_ui/src/quick_shop/view/controllers/shop_controller.dart';
import 'package:fresh_food_ui/src/recipe_posts/data/data_sources/mock_data_source.dart';
import 'package:fresh_food_ui/src/recipe_posts/data/data_sources/remote_data_source.dart';
import 'package:fresh_food_ui/src/recipe_posts/data/repositories/recipe_posts_repository.dart';
import 'package:fresh_food_ui/src/recipe_posts/domain/repositories/recipe_posts_repository.dart';
import 'package:fresh_food_ui/src/recipe_posts/domain/usecases/get_keto_recipe_posts_usecase.dart';
import 'package:fresh_food_ui/src/recipe_posts/domain/usecases/get_paleo_recipe_posts_usecase.dart';
import 'package:fresh_food_ui/src/recipe_posts/domain/usecases/get_recipe_posts_usecase.dart';
import 'package:fresh_food_ui/src/recipe_posts/domain/usecases/get_vegan_recipe_posts_usecase.dart';
import 'package:fresh_food_ui/src/recipe_posts/view/controllers/get_keto_recipe_posts_controller.dart';
import 'package:fresh_food_ui/src/recipe_posts/view/controllers/get_paleo_recipe_posts_controller.dart';
import 'package:fresh_food_ui/src/recipe_posts/view/controllers/get_recipe_posts_controller.dart';
import 'package:fresh_food_ui/src/recipe_posts/view/controllers/get_vegan_recipe_posts_controller.dart';
import 'package:fresh_food_ui/src/search/data/data_sources/mock_data_source.dart';
import 'package:fresh_food_ui/src/search/data/data_sources/remote_data_source.dart';
import 'package:fresh_food_ui/src/search/data/repositories/search_result_repository_impl.dart';
import 'package:fresh_food_ui/src/search/domain/repositories/search_result_repository.dart';
import 'package:fresh_food_ui/src/search/domain/usecases/fetch_product_usecase.dart';
import 'package:fresh_food_ui/src/search/view/controllers/search_controller.dart';
import 'package:get_it/get_it.dart';

final GetIt backend = GetIt.instance;

void init() async {
  // features
  // - controllers
  backend.registerFactory(() => SearchController(backend()));
  backend.registerFactory(() => GetRecipePostsController(backend()));
  backend.registerFactory(() => GetKetoRecipePostsController(backend()));
  backend.registerFactory(() => GetVeganRecipePostsController(backend()));
  backend.registerFactory(() => GetPaleoRecipePostsController(backend()));
  backend.registerFactory(() => FruitStoreController(backend()));
  backend.registerFactory(() => CartController(backend()));
  backend.registerFactory(() => ShopController(backend()));
  backend.registerFactory(() => FruitShopController(backend()));

  // - usecases
  backend.registerLazySingleton(
      () => FetchSearchResultUseCase(searchResultRepository: backend()));
  backend.registerLazySingleton(() => GetKetoRecipePostsUseCase(backend()));
  backend.registerLazySingleton(() => GetRecipePostsUseCase(backend()));
  backend.registerLazySingleton(() => GetVeganRecipePostsUseCase(backend()));
  backend.registerLazySingleton(() => GetPaleoRecipePostsUseCase(backend()));
  backend.registerLazySingleton(() => FetchFruitItemsUseCase(backend()));
  backend.registerLazySingleton(() => FetchProductCartUseCase(backend()));
  backend.registerLazySingleton(() => AddShopItemsToCartUseCase());

  // - repository
  backend.registerLazySingleton<ISearchResultRepository>(
      () => SearchResultRepositoryImpl(searchResultRemoteDataSource: backend()));
  backend.registerLazySingleton<IRecipePostsRepository>(
      () => RecipePostsRepositoryImpl(recipePostsRemoteDataSource: backend()));
  backend.registerLazySingleton<IShopRepository>(
      () => ShopRepositoryImpl(shopRemoteDataSource: backend()));
  backend
      .registerFactory<ICartRepository>(() => CartRepositoryImpl(dataSource: backend()));

  // - data sources
  backend.registerLazySingleton<ISearchResultRemoteDataSource>(
      () => MockSearchResultRemoteDataSourceImpl());
  backend.registerLazySingleton<IRecipePostsRemoteDataSource>(
      () => MockRecipePostsDataSource());
  backend.registerLazySingleton<IShopRemoteDataSource>(() => ShopMockDataSource());
  backend.registerFactory<ICartDataSource>(() => MockCartDataSourceImpl());

  // core

  // external
}
