import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/widgets/textfield.dart';
import 'package:fresh_food_ui/src/presentation/auth/auth.dart';
import 'package:fresh_food_ui/src/presentation/auth/sign_in.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthScreen(
      title: "Create Account",
      form: AuthForm(
        buttonLabel: "CREATE ACCOUNT",
        fields: Column(
          children: [
            CustomTextFormField(hintText: "Full Name"),
            SizedBox(height: 15.h),
            CustomTextFormField(hintText: "Email"),
            SizedBox(height: 15.h),
            CustomTextFormField(hintText: "Password"),
            SizedBox(height: 123.h),
          ],
        ),
      ),
      action: InkWell(
        onTap: () {
          // go to sign in screen.
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignInScreen()));
        },
        child: Text(
          "SIGN IN",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .apply(color: AppColors.medium_grey, fontWeightDelta: 7),
        ),
      ),
    );
  }
}
