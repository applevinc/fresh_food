import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key key,
    this.title,
    this.actionIcon,
    this.actionCallback,
    this.automaticallyImplyLeading = false,
  }) : super(key: key);

  final String title;
  final String actionIcon;
  final Function actionCallback;
  final bool automaticallyImplyLeading;

  @override
  Size get preferredSize => Size.fromHeight(89.h);

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
        InkWell(
          onTap: actionCallback,
          child: Padding(
            padding: EdgeInsets.only(right: 32.w),
            child: ImageIcon(AssetImage(actionIcon)),
          ),
        ),
      ],
    );
  }
}
