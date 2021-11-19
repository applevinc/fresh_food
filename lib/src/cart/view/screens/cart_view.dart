import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/cart/view/controllers/cart_controller.dart';
import 'package:fresh_food_ui/src/cart/view/screens/delivery/delivery.dart';
import 'package:fresh_food_ui/src/cart/view/widgets/cart_items_listview.dart';
import 'package:fresh_food_ui/src/cart/view/widgets/checkout.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CartAppBar(),
      body: Consumer<CartController>(
        builder: (_, cartController, child) {
          if (cartController.items.isEmpty) {
            return Center(
              child: Text(
                'No Item in Cart',
                style: Theme.of(context).textTheme.headline6,
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                CartItemListView(scrollController: scrollController),
                CheckOut(),
                SizedBox(height: 24.h),
                CustomButtom(
                  label: 'Checkout',
                  icon: Icons.arrow_forward,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DeliveryScreen()));
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CartAppBar({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kContainerBottomShadowDecoration(context),
      child: CustomAppBar(title: 'Cart'),
    );
  }
}
