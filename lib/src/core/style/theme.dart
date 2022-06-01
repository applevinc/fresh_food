import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      highlightColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: AppColors.m_medium_grey)),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: AppColors.medium_grey,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 22.7.w),
        hintStyle: TextStyle(
          color: AppColors.medium_grey,
          fontSize: 16.sp,
        ),
        filled: true,
        fillColor: AppColors.lighter_grey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
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
          type: BottomNavigationBarType.fixed),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(AppColors.darker_grey),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: MaterialColor(
          0xff7bed8d, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
          const <int, Color>{
            50: const Color(0xffE9FAEC), //10%
            100: const Color(0xffDDF9E1), //20%
            200: const Color(0xffD1F7D7), //30%
            300: const Color(0xffC4F6CC), //40%
            400: const Color(0xffB8F4C2), //50%
            500: const Color(0xffACF3B7), //60%
            600: const Color(0xffA0F1AD), //70%
            700: const Color(0xff93F0A2), //80%
            800: const Color(0xff87EE98), //90%
            900: const Color(0xff7BED8D), //100%
          },
        ),
      ).copyWith(secondary: AppColors.green),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.darker_grey,
      brightness: Brightness.dark,
      highlightColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          //backgroundColor: AppColors.darker_grey,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: AppColors.m_medium_grey)),
      textTheme: GoogleFonts.poppinsTextTheme(),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.green,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 315.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(36.r)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 22.7.w),
        hintStyle: GoogleFonts.poppins(
          color: AppColors.medium_grey,
          fontSize: 16.sp,
        ),
        filled: true,
        fillColor: AppColors.dark_grey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.darker_grey,
          elevation: 0.0,
          selectedItemColor: AppColors.green,
          unselectedItemColor: AppColors.m_medium_grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(AppColors.lighter_grey),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        primarySwatch: MaterialColor(
          0xff7bed8d, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
          const <int, Color>{
            50: const Color(0xffE9FAEC), //10%
            100: const Color(0xffDDF9E1), //20%
            200: const Color(0xffD1F7D7), //30%
            300: const Color(0xffC4F6CC), //40%
            400: const Color(0xffB8F4C2), //50%
            500: const Color(0xffACF3B7), //60%
            600: const Color(0xffA0F1AD), //70%
            700: const Color(0xff93F0A2), //80%
            800: const Color(0xff87EE98), //90%
            900: const Color(0xff7BED8D), //100%
          },
        ),
      ).copyWith(secondary: AppColors.green),
    );
  }
}
