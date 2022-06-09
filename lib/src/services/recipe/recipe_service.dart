import 'package:fresh_food_ui/src/models/recipe.dart';

abstract class RecipeService {
  Future<void> addUserRecipePrefs({required List<RecipePref> prefs});
  Future<List<Recipe>> fetchRecipes();
}
