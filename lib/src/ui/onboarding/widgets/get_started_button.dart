import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/system_navigation/bottom_nav_bar.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          CustomButton(
            label: "GET STARTED",
            icon: Icons.arrow_forward,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BottomNavBar()));
            },
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}