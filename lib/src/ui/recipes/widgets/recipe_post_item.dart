import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/helpers/navigator.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/models/recipe.dart';
import 'package:fresh_food_ui/src/ui/recipes/screens/recipe_detail_screen.dart';

class RecipePostItem extends StatelessWidget {
  const RecipePostItem(
    this.recipe, {
    Key? key,
  }) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.to(context, RecipePostDetailScreen(recipe));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          color: isDarkMode(context) ? AppColors.dark_grey : AppColors.lighter_grey,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              recipe.imgUrl,
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 23.h,
                bottom: 26.h,
                right: 15.w,
                left: 15.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'Berries mixed together to make a tasty dish.',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: AppColors.medium_grey,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
