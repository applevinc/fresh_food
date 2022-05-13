import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/helpers/navigator.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/textfield.dart';
import 'package:fresh_food_ui/src/ui/auth/create_account.dart';
import 'package:fresh_food_ui/src/ui/auth/widgets/auth_screen.dart';
import 'package:fresh_food_ui/src/ui/onboarding/view/onboarding_view.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AuthScreen(
        title: "Sign In",
        form: Column(
          children: [
            CustomTextFormField(
              controller: _emailController,
              hintText: "Email",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            SizedBox(height: 15.h),
            CustomTextFormField(
              controller: _passwordController,
              obscureText: true,
              hintText: "Password",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            SizedBox(height: 153.h),
            CustomButton(
              label: 'Sign In',
              icon: Icons.arrow_forward,
              onTap: () {
                AppNavigator.to(context, OnboardingScreen());
              },
            ),
          ],
        ),
        action: InkWell(
          onTap: () {
            AppNavigator.to(context, CreateAccountScreen());
          },
          child: Text(
            "CREATE ACCOUNT",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .apply(color: AppColors.medium_grey, fontWeightDelta: 7),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
