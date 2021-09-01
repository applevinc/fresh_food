import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/view/images.dart';
import 'package:fresh_food_ui/view/style/colors.dart';
import 'package:fresh_food_ui/view/style/constants.dart';
import 'package:fresh_food_ui/view/widgets/appbar.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Store",
        actionIcon: AppIcons.search,
        actionCallback: () {
          // got to search screen
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _FeatureImageContainer(),
            _FruitsListView(),
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
            FruitImages.broccoli,
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

class _FruitsListView extends StatelessWidget {
  const _FruitsListView({
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
        itemCount: _fruits.length,
        itemBuilder: (context, index) {
          var fruit = _fruits[index];
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

class _Fruit {
  final String img;
  final String name;
  final Color bgColor;

  _Fruit({
    this.img,
    this.name,
    this.bgColor,
  });
}

var _fruits = <_Fruit>[
  _Fruit(
    name: "Berries",
    img: FruitImages.strawberry,
    bgColor: Color(0xffdd4040),
  ),
  _Fruit(
    name: "Citrus",
    img: FruitImages.orange,
    bgColor: Color(0xffffa700),
  ),
  _Fruit(
    name: "Banana",
    img: FruitImages.banana,
    bgColor: Color(0xffffd958),
  ),
];
