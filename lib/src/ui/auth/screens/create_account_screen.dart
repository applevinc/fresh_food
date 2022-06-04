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
import 'package:fresh_food_ui/src/models/customer.dart';
import 'package:fresh_food_ui/src/models/failure.dart';
import 'package:fresh_food_ui/src/ui/auth/controllers/auth_controller.dart';
import 'package:fresh_food_ui/src/ui/auth/screens/sign_in_screen.dart';
import 'package:fresh_food_ui/src/ui/auth/widgets/text_action_widget.dart';
import 'package:fresh_food_ui/src/ui/onboarding/view/onboarding_view.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _showPassword = false;

  void _togglePasswordVisiblity() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  Future<void> _createAccount() async {
    if (_formKey.currentState!.validate()) {
      final controller = context.read<AuthController>();
      final newCustomer = Customer(
        id: '',
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        email: _emailController.text.trim(),
        recipePrefs: [],
      );

      try {
        await controller.register(
          newCustomer: newCustomer,
          password: _passwordController.text.trim(),
        );
        NotificationMessages.showSuccess('Account created successfully');
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Create Account",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .apply(color: AppColors.green),
                      ),
                      SizedBox(height: 30.h),
                      CustomTextFormField(
                        controller: _firstNameController,
                        labelText: "First Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h),
                      CustomTextFormField(
                        controller: _lastNameController,
                        labelText: "Last Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 15.h),
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
                        obscureText: _showPassword,
                        labelText: "Password",
                        surfixIcon: PasswordVisibilityIcon(
                          visible: _showPassword,
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
                    label: 'Create Account',
                    icon: Icons.arrow_forward,
                    isLoading: controller.isLoading,
                    onTap: _createAccount,
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
            TextActionWidget(
              label: 'SIGN IN',
              onTap: () {
                AppNavigator.to(context, SignInScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
