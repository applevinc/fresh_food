import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/assets/images.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/nutrition_info.dart';
import 'package:fresh_food_ui/src/recipe_posts/domain/entities/recipe_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipePostDetailScreen extends StatelessWidget {
  const RecipePostDetailScreen({
    Key key,
    @required this.recipeEntity,
  }) : super(key: key);

  final RecipeEntity recipeEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '${recipeEntity.name}',
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
            recipeEntity.featuredImg,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 33.h),
          _Ingredient(recipeEntity: recipeEntity),
          SizedBox(height: 25.h),
          _Instructions(recipeEntity: recipeEntity),
          SizedBox(height: 25.h),
          NutritionInfo(entity: recipeEntity),
          SizedBox(height: 35.h),
          CustomButtom(
            label: 'Add 3 Ingredients to Cart',
            icon: Icons.add_shopping_cart,
            onTap: () {},
          )
        ],
      ),
    );
  }
}

class _Instructions extends StatelessWidget {
  const _Instructions({
    Key key,
    @required this.recipeEntity,
  }) : super(key: key);

  final RecipeEntity recipeEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Instructions',
          style: Theme.of(context).textTheme.headline6.copyWith(color: AppColors.green),
        ),
        SizedBox(height: 24.h),
        Text(
          recipeEntity.instructions,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
      ],
    );
  }
}

class _Ingredient extends StatelessWidget {
  const _Ingredient({
    Key key,
    this.recipeEntity,
  }) : super(key: key);

  final RecipeEntity recipeEntity;

  @override
  Widget build(BuildContext context) {
    var items = recipeEntity.ingredients;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ingredients',
          style: Theme.of(context).textTheme.headline6.copyWith(color: AppColors.green),
        ),
        SizedBox(height: 19.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                items.length,
                (index) => _IngredientItem(
                  item: items[index],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RecipeProperty(
                  icon: AppIcons.difficulty,
                  label: recipeEntity.difficulty,
                ),
                SizedBox(height: 15.h),
                RecipeProperty(
                  icon: AppIcons.clock,
                  label: 'Prep ${recipeEntity.prepTime}m',
                ),
                SizedBox(height: 15.h),
                RecipeProperty(
                  icon: AppIcons.cook,
                  label: 'Prep ${recipeEntity.cookTime}m',
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}

class _IngredientItem extends StatelessWidget {
  const _IngredientItem({
    Key key,
    this.item,
  }) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // toggle checkbox
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(AppImages.checkbox),
            SizedBox(width: 15.w),
            Text(
              item,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeProperty extends StatelessWidget {
  const RecipeProperty({
    Key key,
    @required this.icon,
    @required this.label,
  }) : super(key: key);

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(icon),
        SizedBox(width: 15.w),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
