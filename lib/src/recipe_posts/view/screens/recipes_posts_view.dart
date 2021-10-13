import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/recipe_posts/domain/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/recipe_posts/view/controllers/get_recipe_posts_controller.dart';
import 'package:fresh_food_ui/src/recipe_posts/view/screens/keto_posts_view.dart';
import 'package:fresh_food_ui/src/recipe_posts/view/screens/paleo_posts_view.dart';
import 'package:fresh_food_ui/src/recipe_posts/view/screens/vegan_posts_view.dart';
import 'package:fresh_food_ui/src/recipe_posts/view/widgets/recipe_post_item.dart';
import 'package:provider/provider.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [CustomSliverAppBar()];
          },
          body: TabBarView(
            children: [
              AllRecipes(),
              VeganRecipeScreen(),
              KetoRecipeScreen(),
              PaleoRecipeScreen(),
            ],
          ),
        ),
      ),
    );
  }
}

class AllRecipes extends StatefulWidget {
  const AllRecipes({Key key}) : super(key: key);

  @override
  State<AllRecipes> createState() => _AllRecipesState();
}

class _AllRecipesState extends State<AllRecipes> {
  Future<List<RecipeEntity>> _posts;

  @override
  void initState() {
    super.initState();
    final recipeController = context.read<GetRecipePostsController>();
    _posts = recipeController.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<RecipeEntity>>(
      future: _posts,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        var posts = context.watch<GetRecipePostsController>().posts;
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 32.h),
          itemCount: posts.length,
          itemBuilder: (context, index) {
            var post = posts[index];

            return RecipePostItem(recipeEntity: post);
          },
        );
      },
    );
  }
}



class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        'Recipes',
        style: Theme.of(context).textTheme.headline6,
      ),
      actions: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: 32.w),
            child: ImageIcon(AssetImage(AppIcons.search)),
          ),
        ),
      ],
      bottom: TabBarContainer(),
    );
  }
}

class TabBarContainer extends StatelessWidget implements PreferredSizeWidget {
  const TabBarContainer({Key key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(62.h);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kContainerBottomShadowDecoration(context),
      padding: EdgeInsets.only(bottom: 10.h),
      child: TabBar(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BubbleTabIndicator(
          indicatorHeight: 52.h,
          indicatorRadius: 36.r,
          indicatorColor: AppColors.green,
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
        tabs: [
          Tab(text: 'All'),
          Tab(text: 'Vegan'),
          Tab(text: 'Keto'),
          Tab(text: 'Paleo'),
        ],
      ),
    );
  }
}
