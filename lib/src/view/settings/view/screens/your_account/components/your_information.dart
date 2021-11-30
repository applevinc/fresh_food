import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';

class YourInformationView extends StatelessWidget {
  const YourInformationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Information',
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 20.sp),
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
                _YourInformationRow(label: 'Full Name', title: 'Appleyard Vincent'),
                SizedBox(height: 20.h),
                _YourInformationRow(
                    label: 'Address',
                    title: '42 Wallabe Way, London, Unit, hdhhdhdhdhddkdkddkdkdkdk'),
                SizedBox(height: 20.h),
                _YourInformationRow(label: 'Email', title: 'appleyardvincent@gmail.com'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _YourInformationRow extends StatelessWidget {
  const _YourInformationRow({
    Key key,
    @required this.label,
    @required this.title,
  }) : super(key: key);

  final String label;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: AppColors.medium_grey),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: IconButton(
            splashRadius: 20.r,
            splashColor: AppColors.green,
            icon: Icon(
              Icons.edit_outlined,
              color: AppColors.m_medium_grey,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
