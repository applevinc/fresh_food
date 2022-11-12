import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/constants/app_constants.dart';
import 'package:fresh_food_ui/src/core/helpers/navigator.dart';
import 'package:fresh_food_ui/src/core/helpers/validator.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/textfield.dart';
import 'package:fresh_food_ui/src/ui/auth/controllers/sign_in_controller.dart';
import 'package:fresh_food_ui/src/ui/auth/screens/create_account_screen.dart';
import 'package:fresh_food_ui/src/ui/auth/widgets/text_action_widget.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: paddingOnlyHorizontal,
            child: Consumer<SignInController>(
              builder: (BuildContext context, controller, Widget? child) {
                return Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      Text(
                        "Sign In",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: AppColors.green),
                      ),
                      SizedBox(height: 30.h),
                      CustomTextFormField(
                        controller: controller.emailController,
                        labelText: "Email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!Validator.isValidEmail(value)) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h),
                      CustomTextFormField(
                        controller: controller.passwordController,
                        obscureText: controller.hidePassword,
                        labelText: "Password",
                        surfixIcon: PasswordVisibilityIcon(
                          visible: controller.hidePassword,
                          onTap: controller.togglePasswordVisiblity,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (!PasswordValidator.isCorrectLength(value)) {
                            return PasswordValidator.message;
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                );
              },
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
              child: Consumer<SignInController>(
                builder: (BuildContext context, controller, Widget? child) {
                  return CustomButton(
                    label: 'Sign In',
                    icon: Icons.arrow_forward,
                    isLoading: controller.isLoading,
                    onTap: () {
                      controller.signIn(email: 'email', password: 'password');
                    },
                  );
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
}
