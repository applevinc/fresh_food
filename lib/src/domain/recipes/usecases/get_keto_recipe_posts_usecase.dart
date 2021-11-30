import 'package:fresh_food_ui/src/domain/recipes/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/domain/recipes/repositories/recipe_posts_repository.dart';

class GetKetoRecipePostsUseCase {
  final IRecipePostsRepository? recipePostsRepository;

  GetKetoRecipePostsUseCase(this.recipePostsRepository);

  Future<List<RecipeEntity>> call() async {
    return await recipePostsRepository!.fetchKetoRecipePost();
  }
}
