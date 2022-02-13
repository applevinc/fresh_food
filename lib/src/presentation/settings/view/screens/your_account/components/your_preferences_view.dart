import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';

class YourPreferencesView extends StatelessWidget {
  const YourPreferencesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Preferences',
            style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20.sp),
          ),
          SizedBox(height: 25.h),
          Container(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 30.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.dark_grey,
            ),
            child: Column(
              children: [
                _YourPreferencesRow(
                  title: 'Notifications',
                  value: true,
                  onChanged: (bool value) {},
                ),
                //SizedBox(height: 17.h),
                _YourPreferencesRow(
                  title: 'Newsletter',
                  value: false,
                  onChanged: (bool value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _YourPreferencesRow extends StatelessWidget {
  const _YourPreferencesRow(
      {Key? key, required this.title, required this.value, required this.onChanged})
      : super(key: key);

  final String title;
  final bool value;
  final Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Switch(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          activeColor: AppColors.green,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
