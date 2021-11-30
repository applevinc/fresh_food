import 'package:dio/dio.dart';
import 'package:fresh_food_ui/src/data/recipes/models/recipe_model.dart';

abstract class IRecipePostsRemoteDataSource {
  Future<List<RecipeModel>> fetchRecipePosts();
  Future<List<RecipeModel>> fetchKetoRecipePost();
  Future<List<RecipeModel>> fetchVeganRecipePost();
  Future<List<RecipeModel>> fetchPaleoRecipePost();
}

class RecipePostsRemoteDataSource implements IRecipePostsRemoteDataSource {
  final Dio? dio;

  RecipePostsRemoteDataSource({this.dio});

  @override
  Future<List<RecipeModel>> fetchKetoRecipePost() {
    // implement fetchKetoRecipePost
    throw UnimplementedError();
  }

  @override
  Future<List<RecipeModel>> fetchPaleoRecipePost() {
    // implement fetchPaleoRecipePost
    throw UnimplementedError();
  }

  @override
  Future<List<RecipeModel>> fetchRecipePosts() {
    // implement fetchRecipePosts
    throw UnimplementedError();
  }

  @override
  Future<List<RecipeModel>> fetchVeganRecipePost() {
    // implement fetchVeganRecipePost
    throw UnimplementedError();
  }
}
