import 'package:fresh_food_ui/src/models/recipe.dart';

abstract class RecipeService {
  Future<List<Recipe>> fetchRecipes();
}
