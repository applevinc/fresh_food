import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fresh_food_ui/view/images.dart';
import 'package:fresh_food_ui/view/screens/search/notifier.dart';
import 'package:fresh_food_ui/view/style/colors.dart';
import 'package:fresh_food_ui/view/style/constants.dart';
import 'package:fresh_food_ui/view/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          SizedBox(height: 30.h),
          (searchProvider.searchStatus != SearchStatus.results)
              ? SizedBox()
              : Text('Results'),
        ],
      ),
    );
  }
}

// GridView.builder(
//                   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                       maxCrossAxisExtent: 200,
//                       childAspectRatio: 3 / 2,
//                       crossAxisSpacing: 20,
//                       mainAxisSpacing: 20),
//                   itemCount: searchProvider.results.length,
//                   itemBuilder: (BuildContext ctx, index) {
//                     return Container(
//                       alignment: Alignment.center,
//                       child: Text(searchProvider.results[index].name),
//                       decoration: BoxDecoration(
//                           color: Colors.amber, borderRadius: BorderRadius.circular(15)),
//                     );
//                   })

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
