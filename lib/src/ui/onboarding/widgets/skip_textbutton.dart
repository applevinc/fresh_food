import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/ui/onboarding/controllers/pageview_controller.dart';

class SkipTextButton extends StatelessWidget {
  const SkipTextButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: TextButton(
        onPressed: () => controller.skip(),
        child: Text(
          "SKIP",
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
