import 'package:fresh_food_ui/src/domain/recipes/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/domain/recipes/repositories/recipe_posts_repository.dart';

class GetVeganRecipePostsUseCase {
  final IRecipePostsRepository? recipePostsRepository;

  GetVeganRecipePostsUseCase(this.recipePostsRepository);

  Future<List<RecipeEntity>> call() async {
    return await recipePostsRepository!.fetchVeganRecipePost();
  }
}
