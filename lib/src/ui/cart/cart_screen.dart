import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/widgets/system_navigation/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/ui/cart/controller/cart_controller.dart';
import 'package:fresh_food_ui/src/ui/cart/widgets/cart_item.dart';
import 'package:fresh_food_ui/src/ui/cart/widgets/checkout_tile.dart';
import 'package:fresh_food_ui/src/ui/delivery/delivery.dart';
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
                CartItemsSection(scrollController: scrollController),
                CheckOutSection(),
                SizedBox(height: 24.h),
                CustomButton(
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

class CartItemsSection extends StatefulWidget {
  const CartItemsSection({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  State<CartItemsSection> createState() => _CartItemsSectionState();
}

class _CartItemsSectionState extends State<CartItemsSection> {
  @override
  Widget build(BuildContext context) {
    var cartController = context.watch<CartController>();

    return Expanded(
      child: Scrollbar(
        showTrackOnHover: true,
        isAlwaysShown: true,
        controller: widget.scrollController,
        child: ListView.builder(
          controller: widget.scrollController,
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 30.h),
          itemCount: cartController.items.length,
          itemBuilder: (context, index) {
            var item = cartController.items[index];

            return CartItem(cart: item);
          },
        ),
      ),
    );
  }
}

class CheckOutSection extends StatelessWidget {
  const CheckOutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = context.watch<CartController>();

    return Padding(
      padding: EdgeInsets.only(top: 7.h, bottom: 24.h),
      child: Column(
        children: [
          CheckOutTile(label: 'Sub-total', value: '£${cartController.totalAmount}'),
          SizedBox(height: 7.h),
          CheckOutTile(label: 'Delivery', value: 'Standard (free)'),
          SizedBox(height: 7.h),
          CheckOutTile(
            label: 'Total',
            value: '£${cartController.totalAmount}',
            fontSize: 24.sp,
          ),
        ],
      ),
    );
  }
}
