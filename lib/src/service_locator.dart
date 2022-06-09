import 'package:fresh_food_ui/src/services/auth/firebase_auth_service_impl.dart';
import 'package:fresh_food_ui/src/services/manage_profile/firestore_profile_service_impl.dart';
import 'package:fresh_food_ui/src/services/recipe/recipe_service_impl.dart';
import 'package:fresh_food_ui/src/services/store/fake_store_service_impl.dart';
import 'package:fresh_food_ui/src/ui/auth/controllers/auth_controller.dart';
import 'package:fresh_food_ui/src/ui/onboarding/controllers/recipe_pref_controller.dart';
import 'package:fresh_food_ui/src/ui/store/controller/store_controller.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  // controllers
  serviceLocator.registerFactory(() => AuthController(
      authService: FirebaseAuthServiceImpl(),
      profileService: FireStoreProfileServiceImpl()));
  serviceLocator
      .registerFactory(() => RecipePrefController(recipeService: RecipeServiceImpl()));
  serviceLocator
      .registerFactory(() => StoreController(storeService: FakeStoreServiceImpl()));
}
