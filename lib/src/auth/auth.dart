import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/onboarding/view/onboarding_view.dart';



class AuthScreen extends StatelessWidget {
  const AuthScreen({
    Key key,
    @required this.title,
    @required this.form,
    @required this.action,
  }) : super(key: key);

  final String title;
  final Widget form;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 707.h,
              decoration: kContainerBottomShadowDecoration(context),
              child: Column(
                children: [
                  SizedBox(height: 141.h),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .apply(color: AppColors.green),
                  ),
                  SizedBox(height: 111.h),
                  form,
                ],
              ),
            ),
            SizedBox(height: 38.h),
            action,
          ],
        ),
      ),
    );
  }
}

class AuthForm extends StatefulWidget {
  const AuthForm({
    Key key,
    @required this.fields,
    @required this.buttonLabel,
  }) : super(key: key);

  final String buttonLabel;
  final Column fields;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            widget.fields,
            CustomButtom(
              label: widget.buttonLabel,
              icon: Icons.arrow_forward,
              onTap: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.

                  // go to onboarding screen.
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OnboardingScreen()));
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
        hintText: hintText,
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

