import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/ui/onboarding/view/onboarding_view.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({
    Key? key,
    required this.fields,
    required this.buttonLabel,
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
            CustomButton(
              label: widget.buttonLabel,
              icon: Icons.arrow_forward,
              onTap: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
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
