import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/assets/icons.dart';
import 'package:fresh_food_ui/src/assets/images.dart';
import 'package:fresh_food_ui/src/search/notifier.dart';
import 'package:fresh_food_ui/src/style/colors.dart';
import 'package:fresh_food_ui/src/style/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/widgets/appbar.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchNotifier>();

    return Scaffold(
      appBar: CustomAppBar(
        title: (searchProvider.searchStatus != SearchStatus.results)
            ? "Search"
            : "Search Results",
        actionIcon: AppIcons.close,
        actionCallback: () {
          searchProvider.reset();
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Container(
            height: 65.h,
            decoration: kContainerBottomShadowDecoration(context),
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: ImageIcon(AssetImage(AppIcons.search)),
                hintText: "What are you searching for?",
                fillColor: Colors.transparent,
                suffixIcon: Icon(Icons.mic, color: AppColors.green),
              ),
              onSubmitted: (value) {
                // search database
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => _LoadingScreen(query: value)));
              },
            ),
          ),
          (searchProvider.searchStatus != SearchStatus.results)
              ? SizedBox()
              : ResultsGridView(),
        ],
      ),
    );
  }
}

class ResultsGridView extends StatelessWidget {
  const ResultsGridView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = context.watch<SearchNotifier>();

    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150.w,
              childAspectRatio: 150.w / 220.h,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h),
          itemCount: searchProvider.results.length,
          itemBuilder: (_, index) {
            final product = context.watch<SearchNotifier>().results[index];

            return Container(
              height: 183.h,
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 24.h, right: 18.w, left: 18.w, bottom: 11.h),
              decoration: BoxDecoration(
                  color: (isDarkMode(context)) ? Colors.white : AppColors.darker_grey,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x12000000),
                        offset: Offset(0, 5),
                        blurRadius: 30,
                        spreadRadius: 0)
                  ]),
              child: Column(
                children: [
                  Image.asset(product.img),
                  SizedBox(height: 13.h),
                  Text(product.name),
                ],
              ),
            );
          }),
    );
  }
}

class _LoadingScreen extends StatefulWidget {
  const _LoadingScreen({Key key, this.query}) : super(key: key);

  final String query;

  @override
  __LoadingScreenState createState() => __LoadingScreenState();
}

class __LoadingScreenState extends State<_LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // call getresults(widget.query)
    final searchProvider = context.read<SearchNotifier>();
    Future.delayed(const Duration(seconds: 5), () {
      searchProvider.completed();
      goToResultsScreen();
    });
  }

  void goToResultsScreen() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            AppImages.loading,
            height: 136.5.h,
            width: 136.5.w,
          ),
          SizedBox(height: 29.7.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Searching for',
              style: Theme.of(context).textTheme.bodyText1.apply(
                    color: AppColors.medium_grey,
                  ),
            ),
          ),
          SizedBox(height: 3.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.query.toUpperCase(),
              style: Theme.of(context).textTheme.headline5.apply(
                    color: AppColors.green,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
