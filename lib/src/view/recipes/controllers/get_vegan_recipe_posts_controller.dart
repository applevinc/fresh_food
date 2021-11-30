import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/domain/recipes/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/domain/recipes/usecases/get_vegan_recipe_posts_usecase.dart';

class GetVeganRecipePostsController extends ChangeNotifier {
  final GetVeganRecipePostsUseCase? _getVeganRecipePostsUseCase;

  GetVeganRecipePostsController(this._getVeganRecipePostsUseCase);

  List<RecipeEntity> _posts = [];
  List<RecipeEntity> get posts => _posts;

  Future<List<RecipeEntity>> fetch() async {
    try {
      _posts = await _getVeganRecipePostsUseCase!.call();
    } catch (e) {
      rethrow;
    }

    return _posts;
  }
}