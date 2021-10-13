import 'package:fresh_food_ui/src/recipe_posts/domain/entities/recipe_entity.dart';

class RecipeModel extends RecipeEntity {
  final String name;
  final String featuredImg;
  final List<String> ingredients;
  final String difficulty;
  final int prepTime;
  final int cookTime;
  final String instructions;
  final Map<String, String> nutritionInfo;

  RecipeModel({
    this.name,
    this.featuredImg,
    this.ingredients,
    this.difficulty,
    this.prepTime,
    this.cookTime,
    this.instructions,
    this.nutritionInfo,
  }) : super(
          name: name,
          featuredImg: featuredImg,
          ingredients: ingredients,
          difficulty: difficulty,
          prepTime: prepTime,
          cookTime: cookTime,
          instructions: instructions,
          nutritionInfo: nutritionInfo,
        );
}
