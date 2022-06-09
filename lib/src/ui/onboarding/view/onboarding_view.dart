import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/service_locator.dart';
import 'package:fresh_food_ui/src/ui/onboarding/controllers/pageview_controller.dart';
import 'package:fresh_food_ui/src/ui/onboarding/controllers/recipe_pref_controller.dart';
import 'package:fresh_food_ui/src/ui/onboarding/view/select_recipe_pref_view.dart';
import 'package:fresh_food_ui/src/ui/onboarding/widgets/get_started_button.dart';
import 'package:fresh_food_ui/src/ui/onboarding/widgets/onboarding_page_view_item.dart';
import 'package:fresh_food_ui/src/ui/onboarding/widgets/skip_textbutton.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingController()),
        ChangeNotifierProvider(create: (_) => serviceLocator<RecipePrefController>()),
      ],
      builder: (context, child) {
        return Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
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
              ),
            ],
          ),
          bottomNavigationBar: Consumer<OnboardingController>(
            builder: (BuildContext context, controller, Widget? child) {
              final lastOnboardingItemIndex = controller.onboardingList.length;

              if (controller.pageNo != lastOnboardingItemIndex) {
                return SkipTextButton(controller: controller);
              }

              return GetStartedButton();
            },
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

    return Expanded(
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        controller: pageNotifier.pageController,
        itemCount: pageNotifier.onboardingList.length + 1,
        itemBuilder: (context, index) {
          if (index < pageNotifier.onboardingList.length) {
            var onboardingItem = pageNotifier.onboardingList[index];
            return OnboardingPageviewItem(item: onboardingItem);
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
          margin: EdgeInsets.symmetric(horizontal: 5.w),
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
