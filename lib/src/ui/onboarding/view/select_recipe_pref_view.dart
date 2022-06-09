import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/ui/onboarding/controllers/recipe_pref_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectRecipePrefView extends StatelessWidget {
  const SelectRecipePrefView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 62.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Recipe Preferences',
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 55.h),
          SizedBox(
            height: 306.h,
            child: Consumer<RecipePrefController>(
              builder: (BuildContext context, controller, Widget? child) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  itemCount: controller.recipies.length,
                  itemBuilder: (context, index) {
                    final recipe = controller.recipies[index];

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          recipe.title,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Switch(
                          value: recipe.isSelected,
                          onChanged: (bool value) {
                            controller.toggle(index, value);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Text(
              "Tailor your Recipes feed exactly how you like it",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: isDarkMode(context) ? Colors.white : null),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
