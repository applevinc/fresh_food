import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/recipe_posts/domain/entities/recipe_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/recipe_posts/view/screens/recipe_post_detail_view.dart';

class RecipePostItem extends StatelessWidget {
  const RecipePostItem({
    Key key,
    @required this.recipeEntity,
  }) : super(key: key);

  final RecipeEntity recipeEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipePostDetailScreen(
              recipeEntity: recipeEntity,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          color: AppColors.lighter_grey,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              recipeEntity.featuredImg,
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
                    recipeEntity.name,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    'Berries mixed together to make a tasty dish.',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
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
