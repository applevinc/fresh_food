import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/domain/recipes/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/domain/recipes/usecases/get_keto_recipe_posts_usecase.dart';

class GetKetoRecipePostsController extends ChangeNotifier {
  final GetKetoRecipePostsUseCase _getKetoRecipePostsUseCase;

  GetKetoRecipePostsController(this._getKetoRecipePostsUseCase);

  List<RecipeEntity> _posts = [];
  List<RecipeEntity> get posts => _posts;

  Future<List<RecipeEntity>> fetch() async {
    try {
      _posts = await _getKetoRecipePostsUseCase.call();
    } catch (e) {
      rethrow;
    }

    return _posts;
  }
}
