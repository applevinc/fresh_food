import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/assets/images.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/core/widgets/textfield.dart';

class PaymentCardsHorizontalListView extends StatelessWidget {
  const PaymentCardsHorizontalListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 250.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            itemCount: 3,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _AddCard();
              }

              return Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Image.asset(
                  AppImages.debitCard,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AddCard extends StatelessWidget {
  const _AddCard({
    Key? key,
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
        height: 100.h,
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
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14.sp,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

class _AddCardDetails extends StatefulWidget {
  const _AddCardDetails({Key? key}) : super(key: key);

  @override
  State<_AddCardDetails> createState() => _AddCardDetailsState();
}

class _AddCardDetailsState extends State<_AddCardDetails> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _holderNameController;
  late TextEditingController _cardNumberController;
  late TextEditingController _expiryDateController;
  late TextEditingController _securityCodeController;

  @override
  void initState() {
    super.initState();
    _holderNameController = TextEditingController();
    _cardNumberController = TextEditingController();
    _expiryDateController = TextEditingController();
    _securityCodeController = TextEditingController();
  }

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
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 30.h),
                    CustomTextFormField(
                      controller: _holderNameController,
                      prefixIcon: Icon(
                        Icons.person,
                        color: prefixIconColor,
                      ),
                      hintText: 'Cardholder Name',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFormField(
                      controller: _cardNumberController,
                      prefixIcon: Icon(
                        Icons.credit_card,
                        color: prefixIconColor,
                      ),
                      hintText: 'Card Number',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFormField(
                      controller: _expiryDateController,
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: prefixIconColor,
                      ),
                      hintText: 'Expiry Date',
                    ),
                    SizedBox(height: 15.h),
                    CustomTextFormField(
                      controller: _securityCodeController,
                      prefixIcon: Icon(
                        Icons.security,
                        color: prefixIconColor,
                      ),
                      hintText: 'Security Code',
                    ),
                    Spacer(),
                    CustomButton(
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
          ),
        );
      }),
    );
  }
}
