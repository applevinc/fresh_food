import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key key,
    @required this.title,
    this.actions,
    this.automaticallyImplyLeading = false,
    this.tabs,
    this.leading,
  }) : super(key: key);

  final String title;
  final bool automaticallyImplyLeading;
  final List<Widget> actions;
  final List<Widget> tabs;
  final Widget leading;

  @override
  Size get preferredSize => Size.fromHeight((tabs == null) ? 70.h : 150.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      centerTitle: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      bottom: (tabs == null) ? null : TabBarContainer(tabs),
      // systemOverlayStyle: SystemUiOverlayStyle(
      //   statusBarColor: AppColors.green,
      //   statusBarBrightness: isDarkMode(context) ? Brightness.dark : Brightness.light,
      // ),
    );
  }
}

class TabBarContainer extends StatelessWidget implements PreferredSizeWidget {
  const TabBarContainer(this.tabs);

  @override
  Size get preferredSize => Size.fromHeight(90.h);

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kContainerBottomShadowDecoration(context),
      padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
      child: TabBar(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BubbleTabIndicator(
          indicatorHeight: 52.h,
          indicatorRadius: 36.r,
          indicatorColor: AppColors.green,
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
        tabs: tabs,
      ),
    );
  }
}

class CustomAppBar1 extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar1({
    Key key,
    @required this.title,
    this.automaticallyImplyLeading = false,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  final String title;
  final bool automaticallyImplyLeading;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kContainerBottomShadowDecoration(context),
      child: CustomAppBar(
        title: title,
        automaticallyImplyLeading: automaticallyImplyLeading,
        actions: actions,
      ),
    );
  }
}
