import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/global/product_entity.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/nutrition_info.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key key, @required this.product}) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '${product.name}',
        automaticallyImplyLeading: true,
        actions: false,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 15.h, bottom: 70.h),
        children: [
          Image.asset(
            product.img,
            height: 276.h,
            width: 276.w,
          ),
          SizedBox(height: 27.h),
          _SelectQuantity(product: product),
          SizedBox(height: 30.h),
          CustomButtom(
            label: 'ADD TO CART',
            icon: Icons.add_shopping_cart,
            onTap: () {},
          ),
          SizedBox(height: 33.h),
          _ProductInfo(product: product),
        ],
      ),
    );
  }
}

class _SelectQuantity extends StatelessWidget {
  const _SelectQuantity({
    Key key,
    @required this.product,
  }) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 60.h,
      padding: EdgeInsets.only(
        top: 19.h,
        bottom: 20.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.lighter_grey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${product.name}',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(width: 35.w),
          Text(
            '2 heads',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: AppColors.medium_grey,
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(width: 27.w),
          Text(
            '£0.80',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(width: 29.w),
          Icon(
            Icons.expand_more,
            size: 25.sp,
            color: AppColors.m_medium_grey,
          ),
        ],
      ),
    );
  }
}

class _ProductInfo extends StatelessWidget {
  const _ProductInfo({Key key, @required this.product}) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ProductInfoItem(
          product: product,
          title: 'Description',
          bodyText:
              '${product.name} is a lovely green cruciferous vegetable. It’s healthy, delicious and nutritious, and there’s honestly nothing more you need to know.',
        ),
        SizedBox(height: 26.h),
        _ProductInfoItem(
          product: product,
          title: 'Storage',
          bodyText: 'For maximum freshness, keep refrigerated. Wash before use.',
        ),
        SizedBox(height: 26.h),
        _ProductInfoItem(
          product: product,
          title: 'Origin',
          bodyText:
              'Produce of United Kingdom, Republic of Ireland, Germany, Italy, Netherlands, Poland, Spain, USA',
        ),
        SizedBox(height: 26.h),
        _ProductInfoItem(
          product: product,
          title: 'Preparation & Usage',
          bodyText: 'Wash before use. Trim as required.',
        ),
        SizedBox(height: 26.h),
        NutritionInfo(entity: product),
      ],
    );
  }
}

class _ProductInfoItem extends StatelessWidget {
  const _ProductInfoItem({
    Key key,
    @required this.product,
    @required this.title,
    @required this.bodyText,
  }) : super(key: key);

  final ProductEntity product;
  final String title;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline6.copyWith(color: AppColors.green),
        ),
        SizedBox(height: 24.h),
        Text(bodyText, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
