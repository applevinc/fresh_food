import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/models/cart.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 30.w),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: isDarkMode(context) ? AppColors.dark_grey : AppColors.lighter_grey,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Image.asset(
            cart.imgUrl,
            height: 46.h,
            width: 46.w,
          ),
          SizedBox(width: 10.w),
          Text(
            cart.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Spacer(),
          Text(
            '£${cart.price}.00',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}