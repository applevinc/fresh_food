import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key key,
    this.title,
    this.actionIcon,
    this.actionCallback,
    this.actions,
    this.automaticallyImplyLeading = false,
  }) : super(key: key);

  final String title;
  final String actionIcon;
  final Function actionCallback;
  final bool automaticallyImplyLeading;
  final bool actions;

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      centerTitle: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: [
        (actions != false)
            ? InkWell(
                onTap: actionCallback,
                child: Padding(
                  padding: EdgeInsets.only(right: 32.w),
                  child: ImageIcon(AssetImage(actionIcon)),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key key,
    @required this.title,
    @required this.tabs,
    this.automaticallyImplyLeading = false,
    this.leadingIcon,
    this.actions,
  }) : super(key: key);

  final String title;
  final List<Widget> tabs;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;
  final Widget leadingIcon;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: leadingIcon,
      pinned: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: true,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: actions,
      bottom: TabBarContainer(tabs),
    );
  }
}

class TabBarContainer extends StatelessWidget implements PreferredSizeWidget {
  const TabBarContainer(
    this.tabs, {
    Key key,
  }) : super(key: key);

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
