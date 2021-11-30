import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/widgets/textfield.dart';

class EnterMessageField extends StatelessWidget {
  const EnterMessageField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
      child: CustomTextFormField(
        hintText: 'Say something…',
        surfixIcon: GestureDetector(
          onTap: () {
            // SEND MESSAGE
          },
          child: Container(
            margin: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              color: AppColors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 25.sp,
            ),
          ),
        ),
      ),
    );
  }
}
