import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/ui/quick_shop/models/shop_item.dart';

class ShopItemWidget extends StatelessWidget {
  const ShopItemWidget({
    Key? key,
    required this.fruit,
  }) : super(key: key);

  final ShopItem fruit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          fruit.imgUrl,
          width: 42.w,
          height: 40.h,
        ),
        SizedBox(height: 10.h),
        Text(
          fruit.name,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 14.sp, color: AppColors.medium_grey),
        ),
        SizedBox(height: 11.h),
        Container(
          width: 94.w,
          height: 34.h,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: isDarkMode(context) ? AppColors.dark_grey : AppColors.lighter_grey,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.remove,
                  size: 20.sp,
                  color: AppColors.m_medium_grey,
                ),
              ),
              Text(
                '${fruit.count}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.add,
                  size: 20.sp,
                  color: AppColors.m_medium_grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
