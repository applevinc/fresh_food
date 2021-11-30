import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:fresh_food_ui/src/domain/recipes/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/view/recipes/controllers/get_recipe_posts_controller.dart';
import 'package:fresh_food_ui/src/view/recipes/screens/keto_posts_view.dart';
import 'package:fresh_food_ui/src/view/recipes/screens/paleo_posts_view.dart';
import 'package:fresh_food_ui/src/view/recipes/screens/vegan_posts_view.dart';
import 'package:fresh_food_ui/src/view/recipes/widgets/recipe_post_item.dart';
import 'package:provider/provider.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'Recipes',
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Vegan'),
            Tab(text: 'Keto'),
            Tab(text: 'Paleo'),
          ],
          actions: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.only(right: 32.w),
                child: ImageIcon(AssetImage(AppIcons.search)),
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            AllRecipes(),
            VeganRecipeScreen(),
            KetoRecipeScreen(),
            PaleoRecipeScreen(),
          ],
        ),
      ),
    );
  }
}

class AllRecipes extends StatefulWidget {
  const AllRecipes({Key? key}) : super(key: key);

  @override
  State<AllRecipes> createState() => _AllRecipesState();
}

class _AllRecipesState extends State<AllRecipes> {
  Future<List<RecipeEntity>>? _posts;

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
