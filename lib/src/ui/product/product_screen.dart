import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/models/food.dart';
import 'package:fresh_food_ui/src/ui/product/widgets/nutrition_info_item.dart';
import 'package:fresh_food_ui/src/ui/product/widgets/product_info_item.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.product}) : super(key: key);

  final Food product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '${product.name}',
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(right: 30.w, left: 30.w, top: 15.h, bottom: 70.h),
        children: [
          Image.asset(
            product.imgUrl,
            height: 276.h,
            width: 276.w,
          ),
          SizedBox(height: 27.h),
          _SelectQuantitySection(product: product),
          SizedBox(height: 30.h),
          CustomButton(
            label: 'ADD TO CART',
            icon: Icons.add_shopping_cart,
            onTap: () {},
          ),
          SizedBox(height: 33.h),
          _ProductDetailsSection(product: product),
        ],
      ),
    );
  }
}

class _SelectQuantitySection extends StatelessWidget {
  const _SelectQuantitySection({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Food product;

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
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(width: 35.w),
          Text(
            '2 heads',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: AppColors.medium_grey,
                  fontWeight: FontWeight.w500,
                ),
          ),
          SizedBox(width: 27.w),
          Text(
            '£0.80',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
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

class _ProductDetailsSection extends StatelessWidget {
  const _ProductDetailsSection({Key? key, required this.product}) : super(key: key);

  final Food product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductInfoItem(
          product: product,
          title: 'Description',
          bodyText:
              '${product.name} is a lovely green cruciferous vegetable. It’s healthy, delicious and nutritious, and there’s honestly nothing more you need to know.',
        ),
        SizedBox(height: 26.h),
        ProductInfoItem(
          product: product,
          title: 'Storage',
          bodyText: 'For maximum freshness, keep refrigerated. Wash before use.',
        ),
        SizedBox(height: 26.h),
        ProductInfoItem(
          product: product,
          title: 'Origin',
          bodyText:
              'Produce of United Kingdom, Republic of Ireland, Germany, Italy, Netherlands, Poland, Spain, USA',
        ),
        SizedBox(height: 26.h),
        ProductInfoItem(
          product: product,
          title: 'Preparation & Usage',
          bodyText: 'Wash before use. Trim as required.',
        ),
        SizedBox(height: 26.h),
        _NutritionSection(product: product),
      ],
    );
  }
}

class _NutritionSection extends StatelessWidget {
  const _NutritionSection({Key? key, required this.product}) : super(key: key);

  final Food product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nutritional Information',
          style: Theme.of(context).textTheme.headline6!.copyWith(color: AppColors.green),
        ),
        Column(
          children: List.generate(
            product.nutrients.length,
            (index) {
              var nutrient = product.nutrients[index];

              return NutritionInfoItem(
                title: nutrient.title,
                value: nutrient.value.toString(),
              );
            },
          ),
        ),
      ],
    );
  }
}
