import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/domain/recipes/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/domain/recipes/usecases/get_paleo_recipe_posts_usecase.dart';

class GetPaleoRecipePostsController extends ChangeNotifier {
  final GetPaleoRecipePostsUseCase _getPaleoRecipePostsUseCase;

  GetPaleoRecipePostsController(this._getPaleoRecipePostsUseCase);

  List<RecipeEntity> _posts = [];
  List<RecipeEntity> get posts => _posts;

  Future<List<RecipeEntity>> fetch() async {
    try {
      _posts = await _getPaleoRecipePostsUseCase.call();
    } catch (e) {
      rethrow;
    }

    return _posts;
  }
}
