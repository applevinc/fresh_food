import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/view/style/colors.dart';
import 'package:fresh_food_ui/view/style/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 707.h,
              decoration: KContainerBottomShadowDecoration,
              child: Column(
                children: [
                  SizedBox(height: 141.h),
                  Text(
                    'Sign In',
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .apply(color: AppColors.green),
                  ),
                  SizedBox(height: 111.h),
                  LoginForm(),
                ],
              ),
            ),
            SizedBox(height: 38.h),
            InkWell(
              onTap: () {
                // go to create account screen.
              },
              child: Text(
                "CREATE ACCOUNT",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .apply(color: AppColors.medium_grey, fontWeightDelta: 7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
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
            CustomButtom(
              label: "SIGN IN",
              onTap: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key key,
    @required this.hintText,
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 22.h, horizontal: 22.7.w),
        hintText: hintText,
        hintStyle:
            Theme.of(context).textTheme.bodyText1.apply(color: AppColors.medium_grey),
        filled: true,
        fillColor: AppColors.lighter_grey,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      // The validator receives the text that the user has entered.
      // validator: (value) {
      //   if (value == null || value.isEmpty) {
      //     return 'Please enter some text';
      //   }
      //   return null;
      // },
    );
  }
}

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    Key key,
    @required this.label,
    @required this.onTap,
  }) : super(key: key);

  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_forward,
              size: 20.sp,
              color: Colors.white,
            ),
            SizedBox(width: 10.7.w),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
