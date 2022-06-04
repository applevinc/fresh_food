import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/ui/onboarding/models/onboarding.dart';

class OnboardingPageviewItem extends StatelessWidget {
  const OnboardingPageviewItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Onboarding item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 133.h),
        Image.asset(
          item.img,
          height: 315.h,
          width: 315.w,
        ),
        SizedBox(height: 70.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            item.description,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 63.h),
      ],
    );
  }
}
