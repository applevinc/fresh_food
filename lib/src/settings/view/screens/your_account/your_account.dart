import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:fresh_food_ui/src/settings/view/screens/your_account/components/payment_methods.dart';
import 'package:fresh_food_ui/src/settings/view/screens/your_account/components/your_information.dart';
import 'package:fresh_food_ui/src/settings/view/screens/your_account/components/your_preferences_view.dart';

class YourAccountScreen extends StatelessWidget {
  const YourAccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar1(
        title: 'Your Account',
        automaticallyImplyLeading: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 30.w),
        children: [
          YourInformationView(),
          SizedBox(height: 22.h),
          YourPreferencesView(),
          SizedBox(height: 22.h),
          PaymentMethodsView(),
        ],
      ),
    );
  }
}
