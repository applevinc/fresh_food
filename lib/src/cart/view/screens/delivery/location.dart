import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
        child: Column(
          children: [
            CustomTextFormField(hintText: 'Orlando Smith'),
            SizedBox(height: 15.h),
            CustomTextFormField(hintText: 'Zip Code'),
            SizedBox(height: 15.h),
            CustomTextFormField(hintText: 'Street Address'),
            SizedBox(height: 15.h),
            CustomTextFormField(hintText: 'Town/City'),
            SizedBox(height: 15.h),
            CustomButtom(label: 'Continue', icon: Icons.arrow_forward, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
