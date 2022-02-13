import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/theme.dart';
import 'package:fresh_food_ui/src/locator.dart';
import 'package:fresh_food_ui/src/presentation/auth/sign_in.dart';
import 'package:fresh_food_ui/src/presentation/cart/controllers/cart_controller.dart';
import 'package:fresh_food_ui/src/presentation/quick_shop/controllers/fruit_controller.dart';
import 'package:fresh_food_ui/src/presentation/quick_shop/controllers/shop_controller.dart';
import 'package:fresh_food_ui/src/presentation/recipes/controllers/get_keto_recipe_posts_controller.dart';
import 'package:fresh_food_ui/src/presentation/recipes/controllers/get_paleo_recipe_posts_controller.dart';
import 'package:fresh_food_ui/src/presentation/recipes/controllers/get_recipe_posts_controller.dart';
import 'package:fresh_food_ui/src/presentation/recipes/controllers/get_vegan_recipe_posts_controller.dart';
import 'package:fresh_food_ui/src/presentation/search/view/controllers/search_controller.dart';

import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => backend<GetRecipePostsController>()),
          ChangeNotifierProvider(create: (_) => backend<GetVeganRecipePostsController>()),
          ChangeNotifierProvider(create: (_) => backend<GetKetoRecipePostsController>()),
          ChangeNotifierProvider(create: (_) => backend<GetPaleoRecipePostsController>()),
          ChangeNotifierProvider(create: (_) => backend<SearchController>()),
          ChangeNotifierProvider(create: (_) => backend<FruitStoreController>()),
          ChangeNotifierProvider(create: (_) => FruitShopController()),
          ChangeNotifierProvider(create: (_) => CartController()),
          ChangeNotifierProvider(create: (_) => ShopController()),
        ],
        child: MaterialApp(
          title: 'Fresh Food UI',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: SignInScreen(),
        ),
      ),
    );
  }
}
