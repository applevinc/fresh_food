import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/assets/images.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/textfield.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 47.w, vertical: 30.h),
            itemCount: 5,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _AddCard();
              }

              return Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Image.asset(
                  AppImages.debitCard,
                ),
              );
            },
          ),
        ),
        SizedBox(height: 420.h),
      ],
    );
  }
}

class _AddCard extends StatelessWidget {
  const _AddCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => _AddCardDetails(),
          ),
        );
      },
      child: Container(
        width: 284.w,
        height: 180.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.dark_grey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 49.h,
              width: 49.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.m_medium_grey, width: 1),
              ),
              child: Icon(
                Icons.add,
                size: 30.sp,
                color: AppColors.m_medium_grey,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Add Card',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 14.sp,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

class _AddCardDetails extends StatelessWidget {
  const _AddCardDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Add Card',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        var prefixIconColor = AppColors.medium_grey;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.person,
                      color: prefixIconColor,
                    ),
                    hintText: 'Cardholder Name',
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.credit_card,
                      color: prefixIconColor,
                    ),
                    hintText: 'Card Number',
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.date_range,
                      color: prefixIconColor,
                    ),
                    hintText: 'Expiry Date',
                  ),
                  SizedBox(height: 15.h),
                  CustomTextFormField(
                    prefixIcon: Icon(
                      Icons.security,
                      color: prefixIconColor,
                    ),
                    hintText: 'Security Code',
                  ),
                  Spacer(),
                  CustomButtom(
                    label: 'Continue',
                    icon: Icons.arrow_forward,
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
