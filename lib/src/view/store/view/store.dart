import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/assets/product_images.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:fresh_food_ui/src/view/search/view/screens/search_view.dart';
import 'package:fresh_food_ui/src/view/store/data/product_list.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Store",
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            child: Padding(
              padding: EdgeInsets.only(right: 32.w),
              child: ImageIcon(AssetImage(AppIcons.search)),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _FeatureImageContainer(),
            _FruitsHorizontalListView(),
          ],
        ),
      ),
    );
  }
}

class _FeatureImageContainer extends StatelessWidget {
  const _FeatureImageContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 418.h,
      decoration: kContainerBottomShadowDecoration(context),
      child: Column(
        children: [
          Image.asset(
            ProductImages.broccoli,
            height: 293.h,
            width: 293.w,
          ),
          SizedBox(height: 7.h),
          Text(
            'Vegetables',
            style: Theme.of(context).textTheme.headline4,
          ),
          SizedBox(height: 4.h),
          Text(
            'Browse',
            style: Theme.of(context).textTheme.bodyText1.apply(
                  color: AppColors.medium_grey,
                ),
          )
        ],
      ),
    );
  }
}

class _FruitsHorizontalListView extends StatelessWidget {
  const _FruitsHorizontalListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 183.h,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 15.h),
        itemCount: products.length,
        itemBuilder: (context, index) {
          var fruit = products[index];
          return _FruitContainer(
            img: fruit.img,
            name: fruit.name,
            bgColor: fruit.bgColor,
          );
        },
      ),
    );
  }
}

class _FruitContainer extends StatelessWidget {
  const _FruitContainer({
    Key key,
    this.img,
    this.name,
    this.bgColor,
  }) : super(key: key);

  final String img;
  final String name;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      margin: EdgeInsets.only(right: 15.w),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
              color: const Color(0x12000000),
              offset: Offset(0, 5),
              blurRadius: 30,
              spreadRadius: 0)
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            img,
            height: 133.h,
            width: 133.w,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyText1.apply(
                  color: Colors.white,
                ),
          )
        ],
      ),
    );
  }
}
