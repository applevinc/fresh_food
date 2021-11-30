import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/domain/recipes/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/domain/recipes/usecases/get_recipe_posts_usecase.dart';

class GetRecipePostsController extends ChangeNotifier {
  final GetRecipePostsUseCase _getRecipePostsUseCase;

  GetRecipePostsController(this._getRecipePostsUseCase);

  List<RecipeEntity> _posts = [];
  List<RecipeEntity> get posts => _posts;

  Future<List<RecipeEntity>> fetch() async {
    try {
      _posts = await _getRecipePostsUseCase.call();
    } catch (e) {
      rethrow;
    }

    return _posts;
  }
}
