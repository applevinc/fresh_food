import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/cart/cart.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/quick_shop/view/screens/quick_shop.dart';
import 'package:fresh_food_ui/src/recipe_posts/view/screens/recipes_posts_view.dart';
import 'package:fresh_food_ui/src/settings/settigs.dart';
import 'package:fresh_food_ui/src/store/view/store.dart';

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
