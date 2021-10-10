import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/assets/icons.dart';
import 'package:fresh_food_ui/src/cart/cart.dart';
import 'package:fresh_food_ui/src/quick_shop/quick_shop.dart';
import 'package:fresh_food_ui/src/recipes/recipes.dart';
import 'package:fresh_food_ui/src/settings/settigs.dart';
import 'package:fresh_food_ui/src/store/store.dart';
import 'package:fresh_food_ui/src/style/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  bool _quickShopTapped() {
    if (_selectedIndex == 2) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
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
            icon: (_quickShopTapped())
                ? Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.m_medium_grey,
                    ),
                    child: Icon(
                      Icons.add,
                      size: 49.sp,
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.medium_grey,
                    ),
                    child: Icon(
                      Icons.add,
                      size: 49.sp,
                    ),
                  ),
            label: "Quick Shop",
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppIcons.cart)),
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