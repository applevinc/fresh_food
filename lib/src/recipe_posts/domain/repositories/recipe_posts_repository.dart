import 'package:fresh_food_ui/src/recipe_posts/domain/entities/recipe_entity.dart';

abstract class IRecipePostsRepository {
  Future<List<RecipeEntity>> fetchRecipePosts();
  Future<List<RecipeEntity>> fetchKetoRecipePost();
  Future<List<RecipeEntity>> fetchVeganRecipePost();
  Future<List<RecipeEntity>> fetchPaleoRecipePost();
}
