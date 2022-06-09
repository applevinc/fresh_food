import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/helpers/navigator.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/system_navigation/appbar.dart';
import 'package:fresh_food_ui/src/models/failure.dart';
import 'package:fresh_food_ui/src/ui/search/search_screen.dart';
import 'package:fresh_food_ui/src/ui/store/controller/store_controller.dart';
import 'package:fresh_food_ui/src/ui/store/widgets/fruit_container.dart';
import 'package:provider/provider.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _getStoreData();
    });
  }

  _getStoreData() async {
    final controller = context.read<StoreController>();

    if (controller.foods.isEmpty) {
      try {
        await controller.getStore();
        await controller.getFeatureFood();
      } on Failure catch (e) {
        log(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Store",
        actions: [
          InkWell(
            onTap: () {
              AppNavigator.to(context, SearchScreen());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 32.w),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 30.sp,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<StoreController>(
          builder: (BuildContext context, controller, Widget? child) {
            if (controller.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _FeatureItemImageSection(),
                _FruitsHorizontalListViewSection(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _FeatureItemImageSection extends StatelessWidget {
  const _FeatureItemImageSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 418.h,
      decoration: kContainerBottomShadowDecoration(context),
      child: Column(
        children: [
          Consumer<StoreController>(
            builder: (BuildContext context, controller, Widget? child) {
              final featuredFood = controller.featuredFood;

              if (featuredFood == null) {
                return SizedBox.shrink();
              }

              return Image.asset(
                featuredFood.imgUrl,
                height: 293.h,
                width: 293.w,
              );
            },
          ),
          SizedBox(height: 7.h),
          Text(
            'Vegetables',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 4.h),
          Text(
            'Browse',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .apply(color: AppColors.medium_grey),
          )
        ],
      ),
    );
  }
}

class _FruitsHorizontalListViewSection extends StatelessWidget {
  const _FruitsHorizontalListViewSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreController>(
      builder: (BuildContext context, controller, Widget? child) {
        if (controller.isLoading) {
          return CircularProgressIndicator();
        }

        if (controller.foods.isEmpty) {
          return SizedBox.shrink();
        }

        final foods = controller.foods;
        return SizedBox(
          height: 183.h,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 15.h),
            itemCount: foods.length,
            itemBuilder: (context, index) {
              final fruit = foods[index];

              return FruitContainer(
                img: fruit.imgUrl,
                name: fruit.name,
                bgColor: fruit.backgroundColor,
              );
            },
          ),
        );
      },
    );
  }
}
