import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/view/images.dart';
import 'package:fresh_food_ui/view/style/colors.dart';
import 'package:fresh_food_ui/view/style/constants.dart';
import 'package:fresh_food_ui/view/widgets/button.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageNotifier()),
        ChangeNotifierProvider(create: (_) => RecipeNotifier()),
      ],
      builder: (context, child) {
        var pageNotifier = context.watch<PageNotifier>();
        var lastOnboardingItemIndex = _onboardingList.length - 1;

        return Scaffold(
          body: Column(
            children: [
              Container(
                height: 692.h,
                decoration: kContainerBottomShadowDecoration(context),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _OnboardingPageView(),
                    _PageIndicator(),
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

class _GetStarted extends StatelessWidget {
  const _GetStarted({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          CustomButtom(
            label: "GET STARTED",
            onTap: () {},
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}

class _Skip extends StatelessWidget {
  const _Skip({
    Key key,
    @required this.pageNotifier,
  }) : super(key: key);

  final PageNotifier pageNotifier;

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
                .bodyText1
                .apply(color: AppColors.medium_grey, fontWeightDelta: 7),
          ),
        ),
        SizedBox(height: 45.h),
      ],
    );
  }
}

class _OnboardingPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageNotifier = context.watch<PageNotifier>();
    var lastOnboardingItemIndex = _onboardingList.length - 1;

    return SizedBox(
      height: 642.h,
      child: PageView.builder(
        controller: pageNotifier.pageController,
        itemCount: _onboardingList.length,
        itemBuilder: (context, index) {
          var onboardingItem = _onboardingList[index];

          return (pageNotifier.pageNo == lastOnboardingItemIndex)
              ? _SelectRecipePrefWidget()
              : _OnboardingPageviewItem(onboardingItem: onboardingItem);
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
    Key key,
    @required this.onboardingItem,
  }) : super(key: key);

  final _OnboardingModel onboardingItem;

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

class _SelectRecipePrefWidget extends StatelessWidget {
  const _SelectRecipePrefWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var recipeNotifier = context.watch<RecipeNotifier>();

    return Column(
      children: [
        SizedBox(height: 62.h),
        Text(
          'Recipe Preferences',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 55.h),
        SizedBox(
          height: 306.h,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            itemCount: recipeNotifier.recipies.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    recipeNotifier.recipies[index].title,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Switch(
                    value: recipeNotifier.recipies[index].isSelected,
                    onChanged: (bool value) {
                      recipeNotifier.toggle(index, value);
                    },
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 79.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            "Tailor your Recipes feed exactly how you like it",
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 63.h),
      ],
    );
  }
}

class _RecipePref {
  final String title;
  bool isSelected;

  _RecipePref({this.title, this.isSelected});
}

class RecipeNotifier extends ChangeNotifier {
  var recipies = [
    _RecipePref(title: "All", isSelected: false),
    _RecipePref(title: "Vegan", isSelected: false),
    _RecipePref(title: "Vegeterian", isSelected: false),
    _RecipePref(title: "Paleo", isSelected: false),
    _RecipePref(title: "Keto", isSelected: false),
    _RecipePref(title: "Low Carb", isSelected: false),
  ];

  void toggle(int index, bool value) {
    var recipeItem = recipies[index];
    if (index == 0) {
      selectAll();
      notifyListeners();
    }
    recipeItem.isSelected = value;
    notifyListeners();
  }

  void selectAll() {
    for (int i = 0; i < recipies.length; i++) {
      recipies[i].isSelected = true;
    }
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

class _OnboardingModel {
  final String img;
  final String description;
  final Widget widget;

  _OnboardingModel({
    this.img,
    this.description,
    this.widget,
  });
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
  _SelectRecipePrefWidget(),
];
