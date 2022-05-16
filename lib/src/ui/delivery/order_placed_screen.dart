import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/system_navigation/bottom_nav_bar.dart';
import 'package:fresh_food_ui/src/ui/cart/controller/cart_controller.dart';
import 'package:provider/provider.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = context.watch<CartController>();
    var textTheme = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 20.sp, fontWeight: FontWeight.w400);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            isDarkMode(context) ? AppIcons.orderPlacedDark : AppIcons.orderPlacedLight,
            height: 315.h,
            width: 315.w,
          ),
          SizedBox(height: 77.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Order Placed',
              style: textTheme,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Your Order number is',
              style: textTheme,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              '#5678',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 30.sp, color: AppColors.green, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 50.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: CustomButton(
              label: 'Continue',
              icon: Icons.arrow_forward,
              onTap: () {
                cartController.clear();

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => BottomNavBar(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
