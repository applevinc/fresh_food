class RecipeEntity {
  final String name;
  final String featuredImg;
  final List<String> ingredients;
  final String difficulty;
  final int prepTime;
  final int cookTime;
  final String instructions;
  final Map<String, String> nutritionInfo;

  RecipeEntity({
    this.name,
    this.featuredImg,
    this.ingredients,
    this.difficulty,
    this.prepTime,
    this.cookTime,
    this.instructions,
    this.nutritionInfo,
  });
}
