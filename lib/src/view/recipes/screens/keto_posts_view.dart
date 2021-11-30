import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/domain/recipes/entities/recipe_entity.dart';
import 'package:fresh_food_ui/src/view/recipes/controllers/get_keto_recipe_posts_controller.dart';
import 'package:fresh_food_ui/src/view/recipes/widgets/recipe_post_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class KetoRecipeScreen extends StatefulWidget {
  const KetoRecipeScreen({Key? key}) : super(key: key);

  @override
  State<KetoRecipeScreen> createState() => _KetoRecipeScreenState();
}

class _KetoRecipeScreenState extends State<KetoRecipeScreen> {
  Future<List<RecipeEntity>>? _posts;

  @override
  void initState() {
    super.initState();
    final recipeController = context.read<GetKetoRecipePostsController>();
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

        var posts = context.watch<GetKetoRecipePostsController>().posts;
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
