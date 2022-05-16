import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';

class TextActionWidget extends StatelessWidget {
  const TextActionWidget({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        label.toUpperCase(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.button!.apply(color: AppColors.medium_grey),
      ),
    );
  }
}
