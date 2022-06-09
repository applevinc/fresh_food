import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/helpers/navigator.dart';
import 'package:fresh_food_ui/src/core/utils/snackbar_notifications.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/system_navigation/bottom_nav_bar.dart';
import 'package:fresh_food_ui/src/models/failure.dart';
import 'package:fresh_food_ui/src/ui/onboarding/controllers/recipe_pref_controller.dart';
import 'package:provider/provider.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({Key? key}) : super(key: key);

  Future<void> _addUserRecipePrefsToDB(BuildContext context) async {
    try {
      final controller = context.read<RecipePrefController>();
      await controller.addUserRecipePrefsToDB();
      NotificationMessages.showSuccess('Your preferences has been submitted');
      AppNavigator.pushAndRemoveUntil(context, BottomNavBar());
    } on Failure catch (e) {
      log(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          CustomButton(
            label: "GET STARTED",
            icon: Icons.arrow_forward,
            onTap: () => _addUserRecipePrefsToDB(context),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
