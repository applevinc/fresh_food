import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/view/onboarding/controllers/recipe_pref_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectRecipePrefView extends StatelessWidget {
  const SelectRecipePrefView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recipeNotifier = context.watch<RecipeNotifier>();

    return Column(
      children: [
        SizedBox(height: 62.h),
        Text(
          'Recipe Preferences',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 55.h),
        SizedBox(
          height: 306.h,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            itemCount: recipeNotifier.recipies.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    recipeNotifier.recipies[index].title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Switch(
                    value: recipeNotifier.recipies[index].isSelected,
                    onChanged: (bool value) {
                      recipeNotifier.toggle(index, value);
                    },
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 79.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            "Tailor your Recipes feed exactly how you like it",
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 63.h),
      ],
    );
  }
}