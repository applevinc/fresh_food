import 'package:flutter/material.dart';
import 'package:fresh_food_ui/view/images.dart';
import 'package:fresh_food_ui/view/style/colors.dart';
import 'package:fresh_food_ui/view/style/constants.dart';
import 'package:fresh_food_ui/view/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Search",
        actionIcon: AppIcons.close,
        actionCallback: () {
          // pop search screen
          Navigator.pop(context);
        },
      ),
      body: Container(
        height: 65.h,
        decoration: kContainerBottomShadowDecoration(context),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: ImageIcon(AssetImage(AppIcons.search)),
            hintText: "What are you searching for?",
            fillColor: Colors.transparent,
            
            suffixIcon: Icon(Icons.mic, color: AppColors.green),
          ),
        ),
      ),
    );
  }
}
