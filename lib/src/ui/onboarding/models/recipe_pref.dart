import 'package:fresh_food_ui/src/models/customer.dart';

class RecipePrefModel extends RecipePref {
  late bool isSelected;

  RecipePrefModel({
    required super.title,
    this.isSelected = false,
  });
}
