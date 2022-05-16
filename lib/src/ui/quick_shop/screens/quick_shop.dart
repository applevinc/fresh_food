import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/system_navigation/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/ui/quick_shop/controllers/shop_controller.dart';
import 'package:fresh_food_ui/src/ui/quick_shop/widgets/shop_item_widget.dart';
import 'package:provider/provider.dart';

class QuickShopScreen extends StatefulWidget {
  const QuickShopScreen({Key? key}) : super(key: key);

  @override
  State<QuickShopScreen> createState() => _QuickShopScreenState();
}

class _QuickShopScreenState extends State<QuickShopScreen> {
  @override
  void initState() {
    super.initState();
    _fetchShop();
  }

  void _fetchShop() async {}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: CustomAppBar(
          leading: GestureDetector(
            onTap: () {
              // refresh
            },
            child: ImageIcon(AssetImage(AppIcons.refresh)),
          ),
          title: 'Quick Shop',
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Fruit'),
            Tab(text: 'Veg'),
            Tab(text: 'Nuts'),
          ],
          actions: [
            GestureDetector(
              onTap: () {
                // add to cart
              },
              child: Padding(
                padding: EdgeInsets.only(right: 32.w),
                child: ImageIcon(AssetImage(AppIcons.tick)),
              ),
            ),
          ],
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            _ShopItemsGrid(),
            _ShopItemsGrid(),
            _ShopItemsGrid(),
            _ShopItemsGrid(),
          ],
        ),
      ),
    );
  }
}

class _ShopItemsGrid extends StatelessWidget {
  const _ShopItemsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopController>(
      builder: (BuildContext context, controller, Widget? child) {
        if (controller.isLoading) {
          return CircularProgressIndicator();
        }

        if (controller.allFood.isEmpty) {
          return Text('No Items');
        }

        final items = controller.allFood;
        return Container(
          height: 525.h,
          decoration: kContainerBottomShadowDecoration(context),
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 43.h),
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 33.h,
            ),
            itemBuilder: (context, index) {
              final fruit = items[index];
              return ShopItemWidget(fruit: fruit);
            },
          ),
        );
      },
    );
  }
}
