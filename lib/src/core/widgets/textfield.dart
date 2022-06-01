import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.surfixIcon,
    this.validator,
    this.obscureText = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? surfixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: isDarkMode(context) ? Colors.white : null),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: surfixIcon,
      ),
      validator: validator,
    );
  }
}

class PasswordVisibilityIcon extends StatelessWidget {
  const PasswordVisibilityIcon({
    Key? key,
    required this.visible,
    required this.onTap,
  }) : super(key: key);

  final bool visible;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      splashColor: Colors.transparent,
      icon: Icon(
        visible ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
        size: 20.h,
      ),
    );
  }
}
