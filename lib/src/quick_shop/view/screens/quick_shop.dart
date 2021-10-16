import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/quick_shop/view/screens/fruit_shop_view.dart';
import 'package:fresh_food_ui/src/quick_shop/view/screens/nuts_shop_view.dart';
import 'package:fresh_food_ui/src/quick_shop/view/screens/veg_shop_view.dart';

class QuickShopScreen extends StatelessWidget {
  const QuickShopScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              CustomSliverAppBar(
                leadingIcon: ImageIcon(AssetImage(AppIcons.refresh)),
                title: 'Quick Shop',
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Fruit'),
                  Tab(text: 'Veg'),
                  Tab(text: 'Nuts'),
                ],
                actions: [
                  InkWell(
                    onTap: () {
                      // add items to cart
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 32.w),
                      child: ImageIcon(AssetImage(AppIcons.tick)),
                    ),
                  ),
                ],
              ),
            ];
          },
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              _AllProductShopScreen(),
              FruitShopScreen(),
              VegShopScreen(),
              NutsShopScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AllProductShopScreen extends StatelessWidget {
  const _AllProductShopScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('all'),
    );
  }
}
