import 'package:flutter/material.dart';

class _RecipePref {
  final String title;
  bool isSelected;

  _RecipePref({this.title, this.isSelected});
}

class RecipeNotifier extends ChangeNotifier {
  var recipies = [
    _RecipePref(title: "All", isSelected: false),
    _RecipePref(title: "Vegan", isSelected: false),
    _RecipePref(title: "Vegeterian", isSelected: false),
    _RecipePref(title: "Paleo", isSelected: false),
    _RecipePref(title: "Keto", isSelected: false),
    _RecipePref(title: "Low Carb", isSelected: false),
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