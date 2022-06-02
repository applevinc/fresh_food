import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/theme.dart';
import 'package:fresh_food_ui/src/service_locator.dart';
import 'package:fresh_food_ui/src/ui/auth/controllers/auth_controller.dart';
import 'package:fresh_food_ui/src/ui/auth/screens/sign_in_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => serviceLocator<AuthController>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => GetMaterialApp(
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
