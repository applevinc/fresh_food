import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key key,
    @required this.label,
    @required this.onTap,
    @required this.icon,
  }) : super(key: key);

  final String label;
  final Function onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 25.sp,
              color: Colors.white,
            ),
            SizedBox(width: 10.7.w),
            Text(
              label.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
