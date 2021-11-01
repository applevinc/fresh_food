import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/cart/domain/entities/cart_entity.dart';
import 'package:fresh_food_ui/src/cart/view/controllers/cart_controller.dart';
import 'package:fresh_food_ui/src/cart/view/screens/delivery/delivery_address.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
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
  Future<List<CartEntity>> _cartItems;

  @override
  void initState() {
    super.initState();
    var cartController = context.read<CartController>();
    _cartItems = cartController.fetchShopCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CartAppBar(),
      body: FutureBuilder(
        future: _cartItems,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                _ItemListView(),
                _ItemsCheckOut(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ItemListView extends StatelessWidget {
  const _ItemListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = context.watch<CartController>();

    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 30.h),
        itemCount: cartController.items.length,
        itemBuilder: (context, index) {
          var item = cartController.items[index];

          return _Item(cartEntity: item);
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key key,
    this.cartEntity,
  }) : super(key: key);

  final CartEntity cartEntity;

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
            cartEntity.img,
            height: 46.h,
            width: 46.w,
          ),
          SizedBox(width: 10.w),
          Text(
            cartEntity.name,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Spacer(),
          Text(
            '£${cartEntity.price}.00',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

class _ItemsCheckOut extends StatelessWidget {
  const _ItemsCheckOut({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckOutInfo(),
        SizedBox(height: 7.h),
        CheckOutInfo(),
        SizedBox(height: 7.h),
        CheckOutInfo(fontSize: 24),
        SizedBox(height: 24.h),
        CustomButtom(
          label: 'Checkout',
          icon: Icons.arrow_forward,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DeliveryAddressScreen()));
          },
        ),
      ],
    );
  }
}

class CheckOutInfo extends StatelessWidget {
  const CheckOutInfo({
    Key key,
    this.fontSize = 16,
  }) : super(key: key);

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Sub-total',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: fontSize,
              fontWeight: (fontSize == 16) ? FontWeight.w500 : FontWeight.w400),
        ),
        Text(
          '£9.30',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: fontSize,
              fontWeight: (fontSize == 16) ? FontWeight.w500 : FontWeight.w400),
        ),
      ],
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
