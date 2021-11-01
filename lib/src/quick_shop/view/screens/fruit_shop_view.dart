import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/quick_shop/domain/entities/shop_item_entity.dart';
import 'package:fresh_food_ui/src/quick_shop/view/controllers/fruit_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FruitShopScreen extends StatefulWidget {
  const FruitShopScreen({Key key}) : super(key: key);

  @override
  State<FruitShopScreen> createState() => _FruitShopScreenState();
}

class _FruitShopScreenState extends State<FruitShopScreen> {
  Future<List<ShopItemEntity>> _fruitItems;

  @override
  void initState() {
    super.initState();
    var fruitStoreController = context.read<FruitStoreController>();
    _fruitItems = fruitStoreController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ShopItemEntity>>(
      future: _fruitItems,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        var fruits = context.watch<FruitStoreController>().items;
        return _FruitItemGrid(fruits: fruits);
      },
    );
  }
}

class _FruitItemGrid extends StatelessWidget {
  const _FruitItemGrid({
    Key key,
    @required this.fruits,
  }) : super(key: key);

  final List<ShopItemEntity> fruits;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 525.h,
      decoration: kContainerBottomShadowDecoration(context),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 43.h),
        itemCount: fruits.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16.w,
          mainAxisSpacing: 33.h,
        ),
        itemBuilder: (context, index) {
          var fruit = fruits[index];

          return _FruitItem(fruit: fruit);
        },
      ),
    );
  }
}

class _FruitItem extends StatelessWidget {
  const _FruitItem({
    Key key,
    @required this.fruit,
  }) : super(key: key);

  final ShopItemEntity fruit;

  @override
  Widget build(BuildContext context) {
    var fruitShopController = context.watch<FruitShopController>();

    return Column(
      children: [
        Image.asset(
          fruit.img,
          width: 42.w,
          height: 40.h,
        ),
        SizedBox(height: 10.h),
        Text(
          fruit.name,
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontSize: 14.sp, color: AppColors.medium_grey),
        ),
        SizedBox(height: 11.h),
        Container(
          width: 94.w,
          height: 34.h,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
          decoration: BoxDecoration(
            color: isDarkMode(context) ? AppColors.dark_grey : AppColors.lighter_grey,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  fruitShopController.remove(fruit);
                },
                child: Icon(
                  Icons.remove,
                  size: 20.sp,
                  color: AppColors.m_medium_grey,
                ),
              ),
              Text(
                '${fruit.qty}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              InkWell(
                onTap: () {
                  fruitShopController.add(fruit);
                },
                child: Icon(
                  Icons.add,
                  size: 20.sp,
                  color: AppColors.m_medium_grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
