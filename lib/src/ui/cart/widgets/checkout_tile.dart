import 'package:flutter/material.dart';

class CheckOutTile extends StatelessWidget {
  const CheckOutTile({
    Key? key,
    this.fontSize = 16,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: fontSize,
              fontWeight: (fontSize == 16) ? FontWeight.w500 : FontWeight.w400),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: fontSize,
              fontWeight: (fontSize == 16) ? FontWeight.w500 : FontWeight.w400),
        ),
      ],
    );
  }
}