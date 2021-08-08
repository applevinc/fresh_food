import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/view/style/colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      accentColor: AppColors.green,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: AppColors.m_medium_grey),
      ),
      textTheme: TextTheme(
        headline4: TextStyle(
          color: AppColors.m_medium_grey,
          fontSize: 30.sp,
          fontWeight: FontWeight.w400,
        ),
        headline5: TextStyle(
          color: AppColors.m_medium_grey,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
        ),
        headline6: TextStyle(
          color: AppColors.m_medium_grey,
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyText1: TextStyle(
          color: AppColors.m_medium_grey,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.green,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 315.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(36.r)),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 0.0,
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.m_medium_grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.darker_grey,
      brightness: Brightness.dark,
      accentColor: AppColors.green,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darker_grey,
        elevation: 0.0,
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: AppColors.m_medium_grey),
      ),
      textTheme: TextTheme(
        headline4: TextStyle(
          color: AppColors.m_medium_grey,
          fontSize: 30.sp,
          fontWeight: FontWeight.w400,
        ),
        headline6: TextStyle(
          color: AppColors.m_medium_grey,
          fontSize: 20.sp,
          fontWeight: FontWeight.w400,
        ),
        bodyText1: TextStyle(
          color: AppColors.m_medium_grey,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.green,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 315.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(36.r)),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darker_grey,
        elevation: 0.0,
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.m_medium_grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
