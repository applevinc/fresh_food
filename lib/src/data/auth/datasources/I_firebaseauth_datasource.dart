import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/data/auth/models/user_firebase_model.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';

abstract class IFirebaseAuthDatasource {
  Future<UserFirebaseModel> register({
    required Title fullName,
    required Email email,
    required Password password,
  });

  Future<UserFirebaseModel> login({
    required Email email,
    required Password password,
  });
}
