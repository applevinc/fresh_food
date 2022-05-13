import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/helpers/navigator.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/models/food.dart';
import 'package:fresh_food_ui/src/ui/product/product_screen.dart';

class SearchResultItem extends StatelessWidget {
  const SearchResultItem({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Food food;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.to(context, ProductScreen(product: food));
      },
      child: Container(
        height: 183.h,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 24.h, right: 18.w, left: 18.w, bottom: 11.h),
        decoration: BoxDecoration(
          color: (isDarkMode(context)) ? AppColors.darker_grey : Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: const Color(0x12000000),
              offset: Offset(0, 5),
              blurRadius: 30,
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          children: [
            Image.asset(food.imgUrl),
            SizedBox(height: 13.h),
            Text(food.name),
          ],
        ),
      ),
    );
  }
}