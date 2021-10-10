import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/auth/sign_in.dart';
import 'package:fresh_food_ui/src/core/style/theme.dart';
import 'package:fresh_food_ui/src/locator.dart';
import 'package:fresh_food_ui/src/search/view/controllers/search_controller.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => backend<SearchController>()),
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
