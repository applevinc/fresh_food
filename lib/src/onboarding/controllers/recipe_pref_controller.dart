import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/onboarding/models/recipe_pref.dart';

class RecipeNotifier extends ChangeNotifier {
  var recipies = [
    RecipePref(title: "All", isSelected: false),
    RecipePref(title: "Vegan", isSelected: false),
    RecipePref(title: "Vegeterian", isSelected: false),
    RecipePref(title: "Paleo", isSelected: false),
    RecipePref(title: "Keto", isSelected: false),
    RecipePref(title: "Low Carb", isSelected: false),
  ];

  void toggle(int index, bool value) {
    var recipeItem = recipies[index];
    if (index == 0) {
      selectAll();
      notifyListeners();
    }
    recipeItem.isSelected = value;
    notifyListeners();
  }

  void selectAll() {
    for (int i = 0; i < recipies.length; i++) {
      recipies[i].isSelected = true;
    }
  }
}
