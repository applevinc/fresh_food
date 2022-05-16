import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/constants/app_constants.dart';
import 'package:fresh_food_ui/src/core/helpers/navigator.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/textfield.dart';
import 'package:fresh_food_ui/src/ui/auth/create_account.dart';
import 'package:fresh_food_ui/src/ui/auth/widgets/text_action_widget.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: paddingOnlyHorizontal,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Sign In",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .apply(color: AppColors.green),
                  ),
                  SizedBox(height: 30.h),
                  CustomTextFormField(
                    controller: _emailController,
                    labelText: "Email",
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
                    labelText: "Password",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: paddingOnlyVertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: kContainerBottomShadowDecoration(context),
              padding: EdgeInsets.only(bottom: 30.h, right: 20.w, left: 20.w),
              child: CustomButton(
                label: 'Sign In',
                icon: Icons.arrow_forward,
                onTap: () {
                  AppNavigator.to(context, OnboardingScreen());
                },
              ),
            ),
            SizedBox(height: 30.h),
            TextActionWidget(
              label: 'Create Account',
              onTap: () {
                AppNavigator.to(context, CreateAccountScreen());
              },
            ),
          ],
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
