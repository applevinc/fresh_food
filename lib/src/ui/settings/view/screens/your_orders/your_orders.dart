import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:fresh_food_ui/src/ui/settings/view/screens/your_orders/components/order_expansiontile.dart';

class YourOrdersScreen extends StatelessWidget {
  const YourOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(
        title: 'Your Orders',
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h, bottom: 15.h),
          itemCount: 3,
          itemBuilder: (context, index) {
            return OrderExpansionTile();
          }),
    );
  }
}
