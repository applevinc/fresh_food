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
  SearchResultModel(
    name: "Brocolli",
    img: ProductImages.broccoli,
    nutritionInfo: {
      'Serving Size': '250g',
      'Calories': '455 Kcal',
      'Carbohydrates': '10g',
      'Sugar': '5g',
      'Fibre': '2g',
      'Fat': '5g',
      'Saturated Fat ': '3g',
      'Cholesterol': '20mg',
      'Sodium': '20mg',
      'Potassium': '20mg',
      'Vitamin A': '20mg',
      'Vitamin C': '20mg',
      'Calcium Iron': '20mg',
    },
  ),
  SearchResultModel(
    name: "Kale",
    img: ProductImages.kale,
    nutritionInfo: {
      'Serving Size': '250g',
      'Calories': '455 Kcal',
      'Carbohydrates': '10g',
      'Sugar': '5g',
      'Fibre': '2g',
      'Fat': '5g',
      'Saturated Fat ': '3g',
      'Cholesterol': '20mg',
      'Sodium': '20mg',
      'Potassium': '20mg',
      'Vitamin A': '20mg',
      'Vitamin C': '20mg',
      'Calcium Iron': '20mg',
    },
  ),
  SearchResultModel(
    name: "Red Pepper",
    img: ProductImages.red_pepper,
    nutritionInfo: {
      'Serving Size': '250g',
      'Calories': '455 Kcal',
      'Carbohydrates': '10g',
      'Sugar': '5g',
      'Fibre': '2g',
      'Fat': '5g',
      'Saturated Fat ': '3g',
      'Cholesterol': '20mg',
      'Sodium': '20mg',
      'Potassium': '20mg',
      'Vitamin A': '20mg',
      'Vitamin C': '20mg',
      'Calcium Iron': '20mg',
    },
  ),
  SearchResultModel(
    name: "Strawberries",
    img: ProductImages.strawberry,
    nutritionInfo: {
      'Serving Size': '250g',
      'Calories': '455 Kcal',
      'Carbohydrates': '10g',
      'Sugar': '5g',
      'Fibre': '2g',
      'Fat': '5g',
      'Saturated Fat ': '3g',
      'Cholesterol': '20mg',
      'Sodium': '20mg',
      'Potassium': '20mg',
      'Vitamin A': '20mg',
      'Vitamin C': '20mg',
      'Calcium Iron': '20mg',
    },
  ),
];
