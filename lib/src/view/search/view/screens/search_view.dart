import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/assets/images.dart';
import 'package:fresh_food_ui/src/core/global/product_entity.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/view/search/view/controllers/search_controller.dart';
import 'package:fresh_food_ui/src/view/search/view/screens/product_detail_view.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = context.watch<SearchController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: (searchController.searchStatus != SearchingStatus.results)
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => _LoadingScreen(query: value)));
              },
            ),
          ),
          (searchController.searchStatus != SearchingStatus.results)
              ? SizedBox()
              : _SearchResultGridView(),
        ],
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
          itemCount: searchController.results.length,
          itemBuilder: (_, index) {
            final product = context.watch<SearchController>().results[index];

            return _SearchResultItem(product: product);
          }),
    );
  }
}

class _SearchResultItem extends StatelessWidget {
  const _SearchResultItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // go to product detail
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailScreen(product: product)));
      },
      child: Container(
        height: 183.h,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 24.h, right: 18.w, left: 18.w, bottom: 11.h),
        decoration: BoxDecoration(
            color: (isDarkMode(context)) ? AppColors.darker_grey : Colors.white,
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
            Image.asset(product.img!),
            SizedBox(height: 13.h),
            Text(product.name!),
          ],
        ),
      ),
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
  Future<List<ProductEntity>>? results;

  @override
  void initState() {
    super.initState();
    final searchController = context.read<SearchController>();
    results = searchController.getResults(widget.query);
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
              style: Theme.of(context).textTheme.bodyText1!.apply(
                    color: AppColors.medium_grey,
                  ),
            ),
          ),
          SizedBox(height: 3.h),
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.query!.toUpperCase(),
              style: Theme.of(context).textTheme.headline5!.apply(
                    color: AppColors.green,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
