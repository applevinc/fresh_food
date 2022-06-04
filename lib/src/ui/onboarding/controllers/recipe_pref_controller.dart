import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/ui/onboarding/models/recipe_pref.dart';

class RecipePrefController extends ChangeNotifier {
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
}
