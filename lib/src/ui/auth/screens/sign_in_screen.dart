import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/constants/app_constants.dart';
import 'package:fresh_food_ui/src/core/helpers/navigator.dart';
import 'package:fresh_food_ui/src/core/helpers/validator.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/utils/snackbar_notifications.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/textfield.dart';
import 'package:fresh_food_ui/src/models/failure.dart';
import 'package:fresh_food_ui/src/ui/auth/controllers/auth_controller.dart';
import 'package:fresh_food_ui/src/ui/auth/screens/create_account_screen.dart';
import 'package:fresh_food_ui/src/ui/auth/widgets/text_action_widget.dart';
import 'package:fresh_food_ui/src/ui/onboarding/view/onboarding_view.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _hidePassword = true;

  void _togglePasswordVisiblity() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      final controller = context.read<AuthController>();

      try {
       final userId = await controller.signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        NotificationMessages.showSuccess('Login successful');
        AppNavigator.to(context, OnboardingScreen());
      } on Failure catch (e) {
        NotificationMessages.showError(e.message);
      }
    }
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
                    controller: _emailController,
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
                    controller: _passwordController,
                    obscureText: _hidePassword,
                    labelText: "Password",
                    surfixIcon: PasswordVisibilityIcon(
                      visible: _hidePassword,
                      onTap: _togglePasswordVisiblity,
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
              child: Consumer<AuthController>(
                builder: (BuildContext context, controller, Widget? child) {
                  return CustomButton(
                    label: 'Sign In',
                    icon: Icons.arrow_forward,
                    isLoading: controller.isLoading,
                    onTap: _signIn,
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
