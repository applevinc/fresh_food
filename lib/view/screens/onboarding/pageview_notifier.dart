import 'package:flutter/material.dart';
import 'package:fresh_food_ui/view/images.dart';

class OnboardingModel {
  final String img;
  final String description;
  final Widget widget;

  OnboardingModel({
    this.img,
    this.description,
    this.widget,
  });
}

class PageNotifier extends ChangeNotifier {
  int pageNo = 0;
  PageController pageController = PageController(initialPage: 0);

  final onboardingList = [
    OnboardingModel(
      img: AppImages.onboarding_1,
      description: "Quickly search and addhealthy foods to your cart",
    ),
    OnboardingModel(
      img: AppImages.onboarding_2,
      description:
          "With one click you can add every ingredient for a recipe to your cart",
    ),
  ];

  void nextPage(int index) {
    pageNo = index;
    notifyListeners();
  }

  void skip() {
    pageController.jumpToPage(
      onboardingList.length,
    );
    notifyListeners();
  }
}