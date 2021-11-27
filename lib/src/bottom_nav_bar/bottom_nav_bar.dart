import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/cart/view/controllers/cart_controller.dart';
import 'package:fresh_food_ui/src/cart/view/screens/cart_view.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/quick_shop/view/screens/quick_shop.dart';
import 'package:fresh_food_ui/src/recipe_posts/view/screens/recipes_posts_view.dart';
import 'package:fresh_food_ui/src/settings/view/screens/settings.dart';
import 'package:fresh_food_ui/src/store/view/store.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    StoreScreen(),
    RecipesScreen(),
    QuickShopScreen(),
    CartScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cartController = context.watch<CartController>();

    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppIcons.store)),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppIcons.recipes)),
            label: "Recipes",
          ),
          BottomNavigationBarItem(
            icon: (_selectedIndex == 2)
                ? Image.asset(AppIcons.quick_shop_cancel)
                : Image.asset(AppIcons.quick_shop_plus),
            label: "Quick Shop",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                ImageIcon(AssetImage(AppIcons.cart)),
                (cartController.items.isNotEmpty)
                    ? Positioned(
                        bottom: -5.h,
                        right: -9.w,
                        child: Container(
                          width: 20.w,
                          height: 20.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.green,
                          ),
                          child: Text(
                            '${cartController.items.length}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(color: Colors.white, fontSize: 12.sp),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppIcons.settings)),
            label: "Settings",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
