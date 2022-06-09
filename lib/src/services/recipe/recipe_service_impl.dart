import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_food_ui/src/models/datastore.dart';
import 'package:fresh_food_ui/src/models/failure.dart';
import 'package:fresh_food_ui/src/models/recipe.dart';
import 'package:fresh_food_ui/src/services/recipe/recipe_service.dart';

class RecipeServiceImpl implements RecipeService {
  final _recipePrefsCollection =
      FirebaseFirestore.instance.collection('Recipe preferences');

  @override
  Future<List<Recipe>> fetchRecipes() {
    // TODO: implement fetchRecipes
    throw UnimplementedError();
  }

  @override
  Future<void> addUserRecipePrefs({required List<RecipePref> prefs}) async {
    final user = DataStore.currentCustomer;

    if (user != null) {
      Map<String, dynamic> prefsMap = {
        "prefs": List<dynamic>.from(prefs.map((x) => x.toJson())),
      };

      try {
        await _recipePrefsCollection.doc(user.id).set(prefsMap);
      } on Exception {
        throw Failure('Failed to create user profile');
      } on Error {
        throw Failure('Failed to create user profile');
      }
    }
  }
}
