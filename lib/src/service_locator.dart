import 'package:fresh_food_ui/src/services/auth/firebase_auth_service_impl.dart';
import 'package:fresh_food_ui/src/services/manage_profile/firestore_profile_service_impl.dart';
import 'package:fresh_food_ui/src/ui/auth/controllers/auth_controller.dart';
import 'package:get_it/get_it.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> init() async {
  // controllers
  serviceLocator.registerFactory(() => AuthController(
      authService: FirebaseAuthServiceImpl(),
      profileService: FireStoreProfileServiceImpl()));
}
