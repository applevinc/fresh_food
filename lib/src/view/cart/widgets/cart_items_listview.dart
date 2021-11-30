import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/domain/cart/entities/cart_entity.dart';
import 'package:fresh_food_ui/src/view/cart/controllers/cart_controller.dart';
import 'package:provider/provider.dart';

class CartItemListView extends StatefulWidget {
  const CartItemListView({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  State<CartItemListView> createState() => _CartItemListViewState();
}

class _CartItemListViewState extends State<CartItemListView> {
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

            return _Item(cartEntity: item);
          },
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    this.cartEntity,
  }) : super(key: key);

  final CartEntity? cartEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 30.w),
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        color: isDarkMode(context) ? AppColors.dark_grey : AppColors.lighter_grey,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Image.asset(
            cartEntity!.img!,
            height: 46.h,
            width: 46.w,
          ),
          SizedBox(width: 10.w),
          Text(
            cartEntity!.name!,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Spacer(),
          Text(
            '£${cartEntity!.qty}.00',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
