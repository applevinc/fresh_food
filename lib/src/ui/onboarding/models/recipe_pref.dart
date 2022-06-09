import 'package:fresh_food_ui/src/models/recipe.dart';

class RecipePrefModel extends RecipePref {
  late bool isSelected;

  RecipePrefModel({
    required String title,
    this.isSelected = false,
  }) : super(title: title);
}
