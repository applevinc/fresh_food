import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/models/failure.dart';
import 'package:fresh_food_ui/src/services/recipe/recipe_service.dart';
import 'package:fresh_food_ui/src/ui/onboarding/models/recipe_pref.dart';

class RecipePrefController extends ChangeNotifier {
  late final RecipeService _recipeService;

  RecipePrefController({
    required RecipeService recipeService,
  }) : _recipeService = recipeService;

  var recipies = [
    RecipePrefModel(title: "All"),
    RecipePrefModel(title: "Vegan"),
    RecipePrefModel(title: "Vegeterian"),
    RecipePrefModel(title: "Paleo"),
    RecipePrefModel(title: "Keto"),
    RecipePrefModel(title: "Low Carb"),
  ];

  void toggle(int index, bool value) {
    var recipeItem = recipies[index];
    if (index == 0) {
      _selectAll();
      notifyListeners();
    }
    recipeItem.isSelected = value;
    notifyListeners();
  }

  void _selectAll() {
    if (recipies[0].isSelected) {
      recipies[0].isSelected = !recipies[0].isSelected;
      return;
    }

    for (int i = 0; i < recipies.length; i++) {
      recipies[i].isSelected = true;
    }
  }

  Future<void> addUserRecipePrefsToDB() async {
    final prefs = recipies.where((element) => element.isSelected).toList();

    try {
      await _recipeService.addUserRecipePrefs(prefs: prefs);
    } on Failure {
      rethrow;
    }
  }
}
