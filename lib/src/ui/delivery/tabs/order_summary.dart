import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/ui/cart/cart_screen.dart';
import 'package:fresh_food_ui/src/ui/cart/controller/cart_controller.dart';
import 'package:fresh_food_ui/src/ui/delivery/order_placed_screen.dart';
import 'package:fresh_food_ui/src/ui/delivery/tabs/location.dart';
import 'package:provider/provider.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({Key? key}) : super(key: key);

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
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
          padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 30.h),
          child: Column(
            children: [
              CartItemsSection(scrollController: scrollController),
              SizedBox(height: 8.h),
              CustomTextFormField2(hintText: 'Coupon Code'),
              SizedBox(height: 20.h),
              CheckOutSection(),
              CustomButton(
                label: 'Place Order',
                icon: Icons.arrow_forward,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => OrderPlacedScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
