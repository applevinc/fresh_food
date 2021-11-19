import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/cart/view/screens/delivery/tabs/delivery_options.dart';
import 'package:fresh_food_ui/src/cart/view/screens/delivery/tabs/location.dart';
import 'package:fresh_food_ui/src/cart/view/screens/delivery/tabs/order_summary.dart';
import 'package:fresh_food_ui/src/cart/view/screens/delivery/tabs/payment.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';

class DeliveryScreen extends StatelessWidget {
  const DeliveryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Delivery',
          automaticallyImplyLeading: true,
          tabs: [
            Tab(icon: ImageIcon(AssetImage(AppIcons.location))),
            Tab(icon: ImageIcon(AssetImage(AppIcons.delivery))),
            Tab(icon: ImageIcon(AssetImage(AppIcons.payment))),
            Tab(icon: ImageIcon(AssetImage(AppIcons.summary))),
          ],
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            LocationScreen(),
            DeliveryOptionsScreen(),
            PaymentScreen(),
            OrderSummaryScreen(),
          ],
        ),
      ),
    );
  }
}
