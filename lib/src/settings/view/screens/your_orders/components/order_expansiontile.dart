import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';

class OrderExpansionTile extends StatelessWidget {
  const OrderExpansionTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: ExpansionTile(
          backgroundColor:
              isDarkMode(context) ? AppColors.dark_grey : AppColors.lighter_grey,
          collapsedBackgroundColor:
              isDarkMode(context) ? AppColors.dark_grey : AppColors.lighter_grey,
          tilePadding: EdgeInsets.symmetric(horizontal: 30.w),
          childrenPadding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 23.h),
          title: Text(
            'Order #5768',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          children: [
            _OrderRowItem(),
            SizedBox(height: 5.h),
            _OrderRowItem(),
            SizedBox(height: 5.h),
            _OrderRowItem(),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Delivery',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: AppColors.medium_grey),
                ),
                SizedBox(width: 27.w),
                Text(
                  '£10.80',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            SizedBox(height: 5.h),
            _OrderStatus()
          ],
        ),
      ),
    );
  }
}

class _OrderRowItem extends StatelessWidget {
  const _OrderRowItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Broccoli',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Row(
          children: [
            Text(
              '2 heads',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: AppColors.medium_grey),
            ),
            SizedBox(width: 27.w),
            Text(
              '£0.80',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
  }
}

class _OrderStatus extends StatelessWidget {
  const _OrderStatus({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(AppIcons.delivery_selected),
            SizedBox(width: 14.w),
            Text(
              'Shipped',
              style:
                  Theme.of(context).textTheme.bodyText1.copyWith(color: AppColors.green),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              'Total',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: AppColors.medium_grey),
            ),
            SizedBox(width: 27.w),
            Text(
              '£10.80',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
  }
}
