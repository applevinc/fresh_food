import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/error/failure.dart';
import 'package:fresh_food_ui/src/core/utils/snackbar_notifications.dart';
import 'package:fresh_food_ui/src/core/widgets/appbar.dart';
import 'package:fresh_food_ui/src/ui/recipes/controllers/recipes_controller.dart';
import 'package:fresh_food_ui/src/ui/recipes/widgets/recipe_post_item.dart';
import 'package:provider/provider.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  @override
  void initState() {
    super.initState();
    _fetchRecipes();
  }

  void _fetchRecipes() async {
    final controller = context.read<RecipesController>();
    if (controller.recipes.isEmpty) {
      try {
        await controller.fetchRecipes();
      } on Failure catch (f) {
        NotificationMessages.showError(f.message);
      }
    }
  }

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
            _AllRecipes(),
            _VeganRecipes(),
            _KetoRecipes(),
            _PaleoRecipes(),
          ],
        ),
      ),
    );
  }
}

class _AllRecipes extends StatelessWidget {
  const _AllRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesController>(
      builder: (BuildContext context, controller, Widget? child) {
        if (controller.isLoading) {
          return CircularProgressIndicator();
        }
        if (controller.recipes.isEmpty) {
          return Center(child: Text('No recipes'));
        }

        final recipes = controller.recipes.reversed.toList();
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 32.h),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return RecipePostItem(recipe);
          },
        );
      },
    );
  }
}

class _VeganRecipes extends StatelessWidget {
  const _VeganRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesController>(
      builder: (BuildContext context, controller, Widget? child) {
        if (controller.isLoading) {
          return CircularProgressIndicator();
        }
        if (controller.veganRecipes.isEmpty) {
          return Center(child: Text('No recipes'));
        }

        final recipes = controller.veganRecipes.reversed.toList();
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 32.h),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return RecipePostItem(recipe);
          },
        );
      },
    );
  }
}

class _KetoRecipes extends StatelessWidget {
  const _KetoRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesController>(
      builder: (BuildContext context, controller, Widget? child) {
        if (controller.isLoading) {
          return CircularProgressIndicator();
        }
        if (controller.ketoRecipes.isEmpty) {
          return Center(child: Text('No recipes'));
        }

        final recipes = controller.ketoRecipes.reversed.toList();
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 32.h),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return RecipePostItem(recipe);
          },
        );
      },
    );
  }
}

class _PaleoRecipes extends StatelessWidget {
  const _PaleoRecipes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipesController>(
      builder: (BuildContext context, controller, Widget? child) {
        if (controller.isLoading) {
          return CircularProgressIndicator();
        }
        if (controller.paleoRecipes.isEmpty) {
          return Center(child: Text('No recipes'));
        }

        final recipes = controller.paleoRecipes.reversed.toList();
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 32.h),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            return RecipePostItem(recipe);
          },
        );
      },
    );
  }
}
