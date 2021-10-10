import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/auth/auth.dart';
import 'package:fresh_food_ui/src/auth/create_account.dart';
import 'package:fresh_food_ui/src/style/colors.dart';



class SignInScreen extends StatelessWidget {
  const SignInScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      title: "Sign In",
      form: AuthForm(
        buttonLabel: "SIGN IN",
        fields: Column(
          children: [
            CustomTextFormField(hintText: "Email"),
            SizedBox(height: 15.h),
            CustomTextFormField(hintText: "Password"),
            SizedBox(height: 24.h),
            Text(
              "Forgot password?",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .apply(color: AppColors.medium_grey),
            ),
            SizedBox(height: 153.h),
          ],
        ),
      ),
      action: InkWell(
        onTap: () {
          // go to create account screen.
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateAccountScreen()));
        },
        child: Text(
          "CREATE ACCOUNT",
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .apply(color: AppColors.medium_grey, fontWeightDelta: 7),
        ),
      ),
    );
  }
}
