import 'package:fresh_food_ui/src/core/assets/product_images.dart';
import 'package:fresh_food_ui/src/search/data/data_sources/remote_data_source.dart';
import 'package:fresh_food_ui/src/search/data/models/search_result_model.dart';

class MockSearchResultRemoteDataSourceImpl implements ISearchResultRemoteDataSource {
  @override
  Future<List<SearchResultModel>> fetchProduct(String query) async {
    await Future.delayed(const Duration(seconds: 5));
    return await Future.value(_searchResults);
  }
}

var _searchResults = [
  SearchResultModel(name: "Brocolli", img: ProductImages.broccoli),
  SearchResultModel(name: "Kale", img: ProductImages.kale),
  SearchResultModel(name: "Red Pepper", img: ProductImages.red_pepper),
  SearchResultModel(name: "Strawberries", img: ProductImages.strawberry),
];
