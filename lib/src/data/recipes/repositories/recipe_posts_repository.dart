import 'package:fresh_food_ui/src/data/recipes/data_sources/remote_data_source.dart';
import 'package:fresh_food_ui/src/domain/recipes/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/domain/recipes/repositories/recipe_posts_repository.dart';


class RecipePostsRepositoryImpl implements IRecipePostsRepository {
  final IRecipePostsRemoteDataSource? recipePostsRemoteDataSource;

  RecipePostsRepositoryImpl({required this.recipePostsRemoteDataSource});

  @override
  Future<List<RecipeEntity>> fetchKetoRecipePost() async {
    try {
      return await recipePostsRemoteDataSource!.fetchKetoRecipePost();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RecipeEntity>> fetchPaleoRecipePost() async {
    try {
      return await recipePostsRemoteDataSource!.fetchPaleoRecipePost();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RecipeEntity>> fetchRecipePosts() async {
    try {
      return await recipePostsRemoteDataSource!.fetchRecipePosts();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RecipeEntity>> fetchVeganRecipePost() async {
    try {
      return await recipePostsRemoteDataSource!.fetchVeganRecipePost();
    } catch (e) {
      rethrow;
    }
  }
}
