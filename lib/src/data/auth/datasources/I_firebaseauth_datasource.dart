import 'package:fresh_food_ui/src/core/global/failure.dart';
import 'package:fresh_food_ui/src/core/value_objects/title.dart';
import 'package:fresh_food_ui/src/data/auth/models/user.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/email.dart';
import 'package:fresh_food_ui/src/domain/auth/value_objects/password.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class IFirebaseAuthDatasource {
  Future<Result<Failure, Null>> register({
    required Title fullName,
    required Email email,
    required Password password,
  });

  Future<Result<Failure, UserFirebaseModel>> login({
    required Email email,
    required Password password,
  });
}
