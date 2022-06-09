import 'package:fresh_food_ui/src/enums/recipe.dart';
import 'package:fresh_food_ui/src/models/food.dart';

class Recipe {
  Recipe({
    required this.name,
    required this.imgUrl,
    required this.ingredient,
    required this.instructions,
    required this.difficulty,
    required this.preparationTime,
    required this.cookTime,
    required this.nutrient,
    required this.type,
  });

  final String name;
  final String imgUrl;
  final List<Ingredient> ingredient;
  final String instructions;
  final String difficulty;
  final int preparationTime;
  final int cookTime;
  final List<Nutrient> nutrient;
  final RecipeType type;

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        name: json["name"],
        imgUrl: json["imgUrl"],
        ingredient:
            List<Ingredient>.from(json["ingredient"].map((x) => Ingredient.fromJson(x))),
        instructions: json["instructions"],
        difficulty: json["difficulty"],
        preparationTime: json["preparationTime"],
        cookTime: json["cookTime"],
        nutrient: List<Nutrient>.from(json["nutrient"].map((x) => Nutrient.fromJson(x))),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imgUrl": imgUrl,
        "ingredient": List<dynamic>.from(ingredient.map((x) => x.toJson())),
        "instructions": instructions,
        "difficulty": difficulty,
        "preparationTime": preparationTime,
        "cookTime": cookTime,
        "nutrient": List<dynamic>.from(nutrient.map((x) => x.toJson())),
      };
}

class Ingredient {
  Ingredient({
    required this.value,
  });

  final String value;

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}

class RecipePref {
  final String title;

  RecipePref({required this.title});

  factory RecipePref.fromJson(Map<String, dynamic> json) => RecipePref(
        title: json["recipe"],
      );

  Map<String, dynamic> toJson() => {
        "recipe": title,
      };
}
