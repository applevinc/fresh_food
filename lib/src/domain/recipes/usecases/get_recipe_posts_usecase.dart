import 'package:fresh_food_ui/src/domain/recipes/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/domain/recipes/repositories/recipe_posts_repository.dart';

class GetRecipePostsUseCase {
  final IRecipePostsRepository? recipePostsRepository;

  GetRecipePostsUseCase(this.recipePostsRepository);

  Future<List<RecipeEntity>> call() async {
    return await recipePostsRepository!.fetchRecipePosts();
  }
}
