import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    required this.icon,
  }) : super(key: key);

  final String label;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(size.width, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(36),
        ),
      ),
      icon: Icon(
        icon,
        size: 25.h,
        color: Colors.white,
      ),
      label: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.button!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
      ),
    );
  }
}
