import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/recipe_posts/data/data_sources/remote_data_source.dart';
import 'package:fresh_food_ui/src/recipe_posts/domain/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/recipe_posts/domain/repositories/recipe_posts_repository.dart';

class RecipePostsRepositoryImpl implements IRecipePostsRepository {
  final IRecipePostsRemoteDataSource recipePostsRemoteDataSource;

  RecipePostsRepositoryImpl({@required this.recipePostsRemoteDataSource});

  @override
  Future<List<RecipeEntity>> fetchKetoRecipePost() async {
    try {
      return await recipePostsRemoteDataSource.fetchKetoRecipePost();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RecipeEntity>> fetchPaleoRecipePost() async {
    try {
      return await recipePostsRemoteDataSource.fetchPaleoRecipePost();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RecipeEntity>> fetchRecipePosts() async {
    try {
      return await recipePostsRemoteDataSource.fetchRecipePosts();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<RecipeEntity>> fetchVeganRecipePost() async {
    try {
      return await recipePostsRemoteDataSource.fetchVeganRecipePost();
    } catch (e) {
      rethrow;
    }
  }
}
