import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/constants/app_constants.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';

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
      body: SafeArea(
        child: Container(
          color: Colors.red,
          //decoration: kContainerBottomShadowDecoration(context),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style:
                    Theme.of(context).textTheme.headline5!.apply(color: AppColors.green),
              ),
              Flexible(child: form),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: defaultPadding,
        child: action,
      ),
    );
  }
}
