import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:fresh_food_ui/src/ui/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:fresh_food_ui/src/ui/onboarding/controllers/pageview_controller.dart';
import 'package:fresh_food_ui/src/ui/onboarding/controllers/recipe_pref_controller.dart';
import 'package:fresh_food_ui/src/ui/onboarding/models/onboarding.dart';
import 'package:fresh_food_ui/src/ui/onboarding/view/select_recipe_pref_view.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingController()),
        ChangeNotifierProvider(create: (_) => RecipePrefController()),
      ],
      builder: (context, child) {
        var pageNotifier = context.watch<OnboardingController>();
        var lastOnboardingItemIndex = pageNotifier.onboardingList.length;

        return Scaffold(
          body: Column(
            children: [
              Container(
                height: 692.h,
                decoration: kContainerBottomShadowDecoration(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _OnboardingViewSection(),
                    _OnboardingIndicator(),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
              (pageNotifier.pageNo != lastOnboardingItemIndex)
                  ? _Skip(pageNotifier: pageNotifier)
                  : _GetStarted(),
            ],
          ),
        );
      },
    );
  }
}

class _OnboardingViewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageNotifier = context.watch<OnboardingController>();

    return SizedBox(
      height: 642.h,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: pageNotifier.pageController,
        itemCount: pageNotifier.onboardingList.length + 1,
        itemBuilder: (context, index) {
          if (index < pageNotifier.onboardingList.length) {
            var onboardingItem = pageNotifier.onboardingList[index];
            return _OnboardingPageviewItem(onboardingItem: onboardingItem);
          }

          return SelectRecipePrefView();
        },
        onPageChanged: (value) {
          pageNotifier.nextPage(value);
        },
      ),
    );
  }
}

class _OnboardingPageviewItem extends StatelessWidget {
  const _OnboardingPageviewItem({
    Key? key,
    required this.onboardingItem,
  }) : super(key: key);

  final Onboarding onboardingItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 133.h),
        Image.asset(
          onboardingItem.img,
          height: 315.h,
          width: 315.w,
        ),
        SizedBox(height: 70.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            onboardingItem.description,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 63.h),
      ],
    );
  }
}

class _GetStarted extends StatelessWidget {
  const _GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          CustomButton(
            label: "GET STARTED",
            icon: Icons.arrow_forward,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BottomNavBar()));
            },
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

class _Skip extends StatelessWidget {
  const _Skip({
    Key? key,
    required this.pageNotifier,
  }) : super(key: key);

  final OnboardingController pageNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 53.h),
        InkWell(
          onTap: () {
            // go to last page view.
            pageNotifier.skip();
          },
          child: Text(
            "SKIP",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .apply(color: AppColors.medium_grey, fontWeightDelta: 7),
          ),
        ),
        SizedBox(height: 45.h),
      ],
    );
  }
}

class _OnboardingIndicator extends StatelessWidget {
  const _OnboardingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageNotifier = context.watch<OnboardingController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageNotifier.onboardingList.length + 1,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 100),
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          height: 10.h,
          width: 10.w,
          decoration: BoxDecoration(
            color: (index == pageNotifier.pageNo)
                ? AppColors.medium_grey
                : Color(0x4da6b8c9),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
