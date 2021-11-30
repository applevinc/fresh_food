import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/view/cart/controllers/cart_controller.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = context.watch<CartController>();

    return Padding(
      padding: EdgeInsets.only(top: 7.h, bottom: 24.h),
      child: Column(
        children: [
          _CheckOutInfo(label: 'Sub-total', value: '£${cartController.total}'),
          SizedBox(height: 7.h),
          _CheckOutInfo(label: 'Delivery', value: 'Standard (free)'),
          SizedBox(height: 7.h),
          _CheckOutInfo(label: 'Total', value: '£${cartController.total}', fontSize: 24),
        ],
      ),
    );
  }
}

class _CheckOutInfo extends StatelessWidget {
  const _CheckOutInfo({
    Key key,
    this.fontSize = 16,
    @required this.label,
    @required this.value,
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
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: fontSize,
              fontWeight: (fontSize == 16) ? FontWeight.w500 : FontWeight.w400),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: fontSize,
              fontWeight: (fontSize == 16) ? FontWeight.w500 : FontWeight.w400),
        ),
      ],
    );
  }
}
