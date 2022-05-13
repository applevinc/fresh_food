import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/models/food.dart';

class NutrientTile extends StatelessWidget {
  const NutrientTile(
    this.nutrient, {
    Key? key,
  }) : super(key: key);

  final Nutrient nutrient;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          nutrient.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Text(
          nutrient.value.toString(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
