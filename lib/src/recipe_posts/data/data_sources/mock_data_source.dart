import 'package:fresh_food_ui/src/core/assets/images.dart';
import 'package:fresh_food_ui/src/recipe_posts/data/data_sources/remote_data_source.dart';
import 'package:fresh_food_ui/src/recipe_posts/data/models/recipe_model.dart';

class MockRecipePostsDataSource implements IRecipePostsRemoteDataSource {
  int _seconds = 5;

  @override
  Future<List<RecipeModel>> fetchKetoRecipePost() async {
    Future.delayed(Duration(seconds: _seconds));
    return await Future.value(_posts);
  }

  @override
  Future<List<RecipeModel>> fetchPaleoRecipePost() async {
    Future.delayed(Duration(seconds: _seconds));
    return await Future.value(_posts);
  }

  @override
  Future<List<RecipeModel>> fetchRecipePosts() async {
    Future.delayed(Duration(seconds: _seconds));
    return await Future.value(_posts);
  }

  @override
  Future<List<RecipeModel>> fetchVeganRecipePost() async {
    Future.delayed(Duration(seconds: _seconds));
    return await Future.value(_posts);
  }
}

final _posts = [
  RecipeModel(
    name: 'Mixed Berry Melody',
    featuredImg: AppImages.recipe_img,
    ingredients: [
      '4 Raspberries',
      '1 Strawberry',
      '1/2 Lemon',
      '2 Cherries',
      'Mint',
    ],
    difficulty: 'Easy',
    prepTime: 20,
    cookTime: 3,
    nutritionInfo: {
      'Serving Size': '250g',
      'Calories': '455 Kcal',
      'Protein': '10g',
      'Carbohydrates': '20g',
      'Sugar': '5g',
      'Fibre': '2g',
      'Fat': '5g',
      'Saturated Fat': '3g',
      'Cholesterol': '20mg',
      'Sodium': '20mg',
      'Potassium': '20mg',
      'Vitamin A': '20mg',
      'Vitamin C': '20mg',
      'Calcium Iron': '20mg',
    },
    instructions:
        'Start by taking the 4 raspberries, chop them into tiny segments and introduce the strawberry. Check to make sure that the raspberries and the strawberry sit well together, before slicing and dicing a lemon and adding it to this rather strange combination of fruits.Peel the 2 cherries, if it’s even possible to peel a cherry, discard the stalks and place them neatly next to the other fruits. Finish off this imaginary recipe by sourcing a mint leaf, and place it perfectly in the center of the bowl, taking care not to upset the other fruits that have already been placed.',
  ),
  RecipeModel(
    name: 'Berry Melody',
    featuredImg: AppImages.recipe_img,
    ingredients: [
      '4 Raspberries',
      '1 Strawberry',
      '1/2 Lemon',
      '2 Cherries',
      'Mint',
    ],
    difficulty: 'Easy',
    prepTime: 20,
    cookTime: 3,
    nutritionInfo: {
      'Serving Size': '250g',
      'Calories': '455 Kcal',
      'Protein': '10g',
      'Carbohydrates': '20g',
      'Sugar': '5g',
      'Fibre': '2g',
      'Fat': '5g',
      'Saturated Fat': '3g',
      'Cholesterol': '20mg',
      'Sodium': '20mg',
      'Potassium': '20mg',
      'Vitamin A': '20mg',
      'Vitamin C': '20mg',
      'Calcium Iron': '20mg',
    },
    instructions:
        'Start by taking the 4 raspberries, chop them into tiny segments and introduce the strawberry. Check to make sure that the raspberries and the strawberry sit well together, before slicing and dicing a lemon and adding it to this rather strange combination of fruits.Peel the 2 cherries, if it’s even possible to peel a cherry, discard the stalks and place them neatly next to the other fruits. Finish off this imaginary recipe by sourcing a mint leaf, and place it perfectly in the center of the bowl, taking care not to upset the other fruits that have already been placed.',
  ),
  RecipeModel(
    name: 'Orange Melody',
    featuredImg: AppImages.recipe_img,
    ingredients: [
      '4 Raspberries',
      '1 Strawberry',
      '1/2 Lemon',
      '2 Cherries',
      'Mint',
    ],
    difficulty: 'Easy',
    prepTime: 20,
    cookTime: 3,
    nutritionInfo: {
      'Serving Size': '250g',
      'Calories': '455 Kcal',
      'Protein': '10g',
      'Carbohydrates': '20g',
      'Sugar': '5g',
      'Fibre': '2g',
      'Fat': '5g',
      'Saturated Fat': '3g',
      'Cholesterol': '20mg',
      'Sodium': '20mg',
      'Potassium': '20mg',
      'Vitamin A': '20mg',
      'Vitamin C': '20mg',
      'Calcium Iron': '20mg',
    },
    instructions:
        'Start by taking the 4 raspberries, chop them into tiny segments and introduce the strawberry. Check to make sure that the raspberries and the strawberry sit well together, before slicing and dicing a lemon and adding it to this rather strange combination of fruits.Peel the 2 cherries, if it’s even possible to peel a cherry, discard the stalks and place them neatly next to the other fruits. Finish off this imaginary recipe by sourcing a mint leaf, and place it perfectly in the center of the bowl, taking care not to upset the other fruits that have already been placed.',
  ),
  RecipeModel(
    name: 'Apple Melody',
    featuredImg: AppImages.recipe_img,
    ingredients: [
      '4 Raspberries',
      '1 Strawberry',
      '1/2 Lemon',
      '2 Cherries',
      'Mint',
    ],
    difficulty: 'Easy',
    prepTime: 10,
    cookTime: 8,
    nutritionInfo: {
      'Serving Size': '250g',
      'Calories': '455 Kcal',
      'Protein': '10g',
      'Carbohydrates': '20g',
      'Sugar': '5g',
      'Fibre': '2g',
      'Fat': '5g',
      'Saturated Fat': '3g',
      'Cholesterol': '20mg',
      'Sodium': '20mg',
      'Potassium': '20mg',
      'Vitamin A': '20mg',
      'Vitamin C': '20mg',
      'Calcium Iron': '20mg',
    },
    instructions:
        'Start by taking the 4 raspberries, chop them into tiny segments and introduce the strawberry. Check to make sure that the raspberries and the strawberry sit well together, before slicing and dicing a lemon and adding it to this rather strange combination of fruits.Peel the 2 cherries, if it’s even possible to peel a cherry, discard the stalks and place them neatly next to the other fruits. Finish off this imaginary recipe by sourcing a mint leaf, and place it perfectly in the center of the bowl, taking care not to upset the other fruits that have already been placed.',
  ),
];
