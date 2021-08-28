import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/view/images.dart';
import 'package:fresh_food_ui/view/style/colors.dart';
import 'package:fresh_food_ui/view/style/constants.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageNotifier(),
      builder: (context, child) {
        var pageNotifier = context.watch<PageNotifier>();

        return Scaffold(
          body: Column(
            children: [
              Container(
                height: 692.h,
                decoration: kContainerBottomShadowDecoration(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 133.h),
                    _OnboardingPageView(),
                    SizedBox(height: 63.h),
                    _PageIndicator(),
                    SizedBox(height: 40.h),
                  ],
                ),
              ),
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
                      .bodyText1
                      .apply(color: AppColors.medium_grey, fontWeightDelta: 7),
                ),
              ),
              SizedBox(height: 45.h),
            ],
          ),
        );
      },
    );
  }
}

class _OnboardingPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageNotifier = context.watch<PageNotifier>();

    return SizedBox(
      height: 443.h,
      child: PageView.builder(
        controller: pageNotifier.pageController,
        itemCount: _onboardingList.length,
        itemBuilder: (context, index) {
          var onboardingItem = _onboardingList[index];

          return Column(
            children: [
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
              )
            ],
          );
        },
        onPageChanged: (value) {
          pageNotifier.nextPage(value);
        },
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  const _PageIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageNotifier = context.watch<PageNotifier>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        _onboardingList.length,
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

class PageNotifier extends ChangeNotifier {
  int pageNo = 0;
  PageController pageController = PageController(initialPage: 0);

  void nextPage(int index) {
    pageNo = index;
    notifyListeners();
  }

  void skip() {
    pageController.jumpToPage(
      _onboardingList.length - 1,
    );
    notifyListeners();
  }
}

class _OnboardingModel {
  final String img;
  final String description;

  _OnboardingModel({this.img, this.description});
}

final _onboardingList = [
  _OnboardingModel(
    img: AppImages.onboarding_1,
    description: "Quickly search and addhealthy foods to your cart",
  ),
  _OnboardingModel(
    img: AppImages.onboarding_2,
    description: "With one click you can add every ingredient for a recipe to your cart",
  ),
];
