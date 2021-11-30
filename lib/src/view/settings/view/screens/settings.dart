import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/view/settings/view/screens/live_chat/live_chat.dart';
import 'package:fresh_food_ui/src/view/settings/view/screens/your_account/your_account.dart';
import 'package:fresh_food_ui/src/view/settings/view/screens/your_orders/your_orders.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(title: 'Settings'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  CustomListTile(
                    title: 'Your Account',
                    leading: Icons.person_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => YourAccountScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 2.h),
                  CustomListTile(
                    title: 'Your Orders',
                    leading: Icons.list_alt_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => YourOrdersScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 2.h),
                  CustomListTile(
                    title: 'Live Chat',
                    leading: Icons.chat_outlined,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LiveChatScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 2.h),
                  CustomListTile(
                    title: 'Dark Mode',
                    leading: Icons.light_mode_outlined,
                    trailing: Switch(
                      value: false,
                      activeColor: AppColors.green,
                      onChanged: (value) {},
                    ),
                    onTap: () {
                      // TODO: Implement button switch darkmode
                    },
                  ),
                ],
              ),
            ),
            CustomListTile(
              title: 'Sign Out',
              leading: Icons.cancel,
              trailing: SizedBox.shrink(),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    Key key,
    @required this.title,
    @required this.leading,
    @required this.onTap,
    this.trailing = const Icon(
      Icons.chevron_right,
      color: AppColors.m_medium_grey,
    ),
  }) : super(key: key);

  final String title;
  final IconData leading;
  final Widget trailing;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      tileColor: isDarkMode(context) ? AppColors.dark_grey : AppColors.lighter_grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      leading: Icon(
        leading,
        color: AppColors.green,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: trailing,
    );
  }
}
