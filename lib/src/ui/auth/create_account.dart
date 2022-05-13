import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/helpers/navigator.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/textfield.dart';
import 'package:fresh_food_ui/src/ui/auth/sign_in.dart';
import 'package:fresh_food_ui/src/ui/auth/widgets/auth_screen.dart';

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

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AuthScreen(
        title: "Create Account",
        form: Column(
          children: [
            CustomTextFormField(
              controller: _firstNameController,
              hintText: "First Name",
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
              hintText: "Last Name",
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
            SizedBox(height: 123.h),
            CustomButton(
              label: 'CREATE ACCOUNT',
              icon: Icons.arrow_forward,
              onTap: () {},
            ),
          ],
        ),
        action: InkWell(
          onTap: () {
            AppNavigator.to(context, SignInScreen());
          },
          child: Text(
            "SIGN IN",
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
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
