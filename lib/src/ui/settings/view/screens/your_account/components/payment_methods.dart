import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/ui/delivery/tabs/payment_cards_horizontal_listview.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: Text(
            'Payment Methods',
            style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 20.sp),
          ),
        ),
        SizedBox(height: 25.h),
        PaymentCardsHorizontalListView(),
      ],
    );
  }
}
