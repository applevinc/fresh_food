import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/widgets/system_navigation/appbar.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/models/food.dart';
import 'package:fresh_food_ui/src/models/recipe.dart';
import 'package:fresh_food_ui/src/ui/recipes/widgets/ingredient_item.dart';
import 'package:fresh_food_ui/src/ui/recipes/widgets/nutrient_tile.dart';
import 'package:fresh_food_ui/src/ui/recipes/widgets/recipe_property.dart';

class RecipePostDetailScreen extends StatelessWidget {
  const RecipePostDetailScreen(
    this.recipe, {
    Key? key,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '${recipe.name}',
        automaticallyImplyLeading: true,
        actions: [
          InkWell(
            onTap: () {
              // share recipe
            },
            child: Padding(
              padding: EdgeInsets.only(right: 32.w),
              child: ImageIcon(AssetImage(AppIcons.share)),
            ),
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 15.h, bottom: 70.h),
        children: [
          Image.asset(
            recipe.imgUrl,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 33.h),
          _IngredientsSection(recipe: recipe),
          SizedBox(height: 25.h),
          _InstructionsSection(recipe: recipe),
          SizedBox(height: 25.h),
          _NutritionSection(nutrients: recipe.nutrient),
          SizedBox(height: 35.h),
          CustomButton(
            label: 'Add to Cart',
            icon: Icons.add_shopping_cart,
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class _InstructionsSection extends StatelessWidget {
  const _InstructionsSection({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instructions',
          style: Theme.of(context).textTheme.headline6!.copyWith(color: AppColors.green),
        ),
        SizedBox(height: 24.h),
        Text(
          recipe.instructions,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}

class _IngredientsSection extends StatelessWidget {
  const _IngredientsSection({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final ingredient = recipe.ingredient;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: Theme.of(context).textTheme.headline6!.copyWith(color: AppColors.green),
        ),
        SizedBox(height: 19.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                ingredient.length,
                (index) => IngredientItem(item: ingredient[index].value),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecipeProperty(
                  icon: AppIcons.difficulty,
                  label: recipe.difficulty,
                ),
                SizedBox(height: 15.h),
                RecipeProperty(
                  icon: AppIcons.clock,
                  label: 'Prep ${recipe.preparationTime}m',
                ),
                SizedBox(height: 15.h),
                RecipeProperty(
                  icon: AppIcons.cook,
                  label: 'Prep ${recipe.cookTime}m',
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class _NutritionSection extends StatelessWidget {
  const _NutritionSection({Key? key, required this.nutrients}) : super(key: key);

  final List<Nutrient> nutrients;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(nutrients.length, (index) {
        final nutrient = nutrients[index];
        return NutrientTile(nutrient);
      }),
    );
  }
}
