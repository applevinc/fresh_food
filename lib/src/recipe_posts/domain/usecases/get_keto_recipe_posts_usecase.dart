import 'package:fresh_food_ui/src/recipe_posts/domain/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/recipe_posts/domain/repositories/recipe_posts_repository.dart';

class GetKetoRecipePostsUseCase {
  final IRecipePostsRepository recipePostsRepository;

  GetKetoRecipePostsUseCase(this.recipePostsRepository);

  Future<List<RecipeEntity>> call() async {
    return await recipePostsRepository.fetchKetoRecipePost();
  }
}