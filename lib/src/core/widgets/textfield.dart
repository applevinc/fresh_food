import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.surfixIcon,
  }) : super(key: key);

  final String hintText;
  final Widget? prefixIcon;
  final Widget? surfixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: surfixIcon,
      ),
      // The validator receives the text that the user has entered.
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter some text';
      //   }
      //   return null;
      // },
    );
  }
}
