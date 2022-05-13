import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({
    Key? key,
    required this.title,
    required this.form,
    required this.action,
  }) : super(key: key);

  final String title;
  final Widget form;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 707.h,
              decoration: kContainerBottomShadowDecoration(context),
              child: Column(
                children: [
                  SizedBox(height: 141.h),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .apply(color: AppColors.green),
                  ),
                  SizedBox(height: 111.h),
                  form,
                ],
              ),
            ),
            SizedBox(height: 38.h),
            action,
          ],
        ),
      ),
    );
  }
}