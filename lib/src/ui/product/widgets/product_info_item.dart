import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/models/food.dart';

class ProductInfoItem extends StatelessWidget {
  const ProductInfoItem({
    Key? key,
    required this.product,
    required this.title,
    required this.bodyText,
  }) : super(key: key);

  final Food product;
  final String title;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(color: AppColors.green),
        ),
        SizedBox(height: 24.h),
        Text(bodyText, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
