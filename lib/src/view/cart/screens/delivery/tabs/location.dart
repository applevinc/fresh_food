import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField2(hintText: 'Orlando Smith'),
            SizedBox(height: 15.h),
            CustomTextFormField2(hintText: 'Zip Code'),
            SizedBox(height: 15.h),
            CustomTextFormField2(hintText: 'Street Address'),
            SizedBox(height: 15.h),
            CustomTextFormField2(hintText: 'Town/City'),
            SizedBox(height: 15.h),
            CustomButtom(
              label: 'Continue',
              icon: Icons.arrow_forward,
              onTap: () {
                if (_formKey.currentState.validate()) {
                  DefaultTabController.of(context).animateTo(1);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField2 extends StatefulWidget {
  const CustomTextFormField2({
    Key key,
    @required this.hintText,
  }) : super(key: key);

  final String hintText;

  @override
  State<CustomTextFormField2> createState() => _CustomTextFormField2State();
}

class _CustomTextFormField2State extends State<CustomTextFormField2> {
  bool showSuffixIcon = false;

  void _showSuffix() {
    setState(() {
      showSuffixIcon = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: (showSuffixIcon) ? Image.asset(AppIcons.delivery_selected) : null,
      ),
      //The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        _showSuffix();
        return null;
      },
    );
  }
}
