import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/view/cart/controllers/cart_controller.dart';
import 'package:fresh_food_ui/src/view/cart/screens/delivery/delivery.dart';
import 'package:fresh_food_ui/src/view/cart/widgets/cart_items_listview.dart';
import 'package:fresh_food_ui/src/view/cart/widgets/checkout.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(title: 'Cart'),
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
