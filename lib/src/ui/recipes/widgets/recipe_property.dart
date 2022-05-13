import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecipeProperty extends StatelessWidget {
  const RecipeProperty({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final String icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(icon),
        SizedBox(width: 15.w),
        Text(
          label!,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
