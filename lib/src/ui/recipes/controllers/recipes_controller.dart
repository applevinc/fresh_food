import 'package:flutter/cupertino.dart';
import 'package:fresh_food_ui/src/models/recipe.dart';

class RecipesController extends ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> get recipes => _recipes;
  List<Recipe> _veganRecipes = [];
  List<Recipe> get veganRecipes => _veganRecipes;
  List<Recipe> _ketoRecipes = [];
  List<Recipe> get ketoRecipes => _ketoRecipes;
  List<Recipe> _paleoRecipes = [];
  List<Recipe> get paleoRecipes => _paleoRecipes;

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  _setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> fetchRecipes() async {}
}
