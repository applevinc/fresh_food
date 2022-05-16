import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/assets/images.dart';
import 'package:fresh_food_ui/src/core/helpers/navigator.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/system_navigation/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/ui/search/controllers/search_controller.dart';
import 'package:fresh_food_ui/src/ui/search/widgets/search_result_item.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = context.watch<SearchController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: searchController.searchStatus != SearchingStatus.results
            ? "Search"
            : "Search Results",
        actions: [
          InkWell(
            onTap: () {
              searchController.reset();
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 32.w),
              child: ImageIcon(AssetImage(AppIcons.close)),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          _SearchBarSection(),
          searchController.searchStatus != SearchingStatus.results
              ? SizedBox()
              : _SearchResultGridView(),
        ],
      ),
    );
  }
}

class _SearchBarSection extends StatelessWidget {
  const _SearchBarSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          AppNavigator.to(context, _LoadingScreen(query: value));
        },
      ),
    );
  }
}

class _SearchResultGridView extends StatelessWidget {
  const _SearchResultGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = context.watch<SearchController>();

    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150.w,
            childAspectRatio: 150.w / 220.h,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 15.h,
          ),
          itemCount: searchController.searchResults.length,
          itemBuilder: (_, index) {
            final food = context.watch<SearchController>().searchResults[index];

            return SearchResultItem(food: food);
          }),
    );
  }
}

class _LoadingScreen extends StatefulWidget {
  const _LoadingScreen({Key? key, this.query}) : super(key: key);

  final String? query;

  @override
  __LoadingScreenState createState() => __LoadingScreenState();
}

class __LoadingScreenState extends State<_LoadingScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
      gotoResultsScreen();
    });
  }

  gotoResultsScreen() {
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
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .apply(color: AppColors.medium_grey),
            ),
          ),
          SizedBox(height: 3.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.query!.toUpperCase(),
              style: Theme.of(context).textTheme.headline5!.apply(color: AppColors.green),
            ),
          ),
        ],
      ),
    );
  }
}
